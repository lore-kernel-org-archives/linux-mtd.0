Received: from smtp.newsguy.com ([74.209.136.69])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1RGAJX-00021S-0p
	for linux-mtd@lists.infradead.org; Tue, 18 Oct 2011 14:06:43 +0000
Message-ID: <4E9D87C7.9070502@newsguy.com>
Date: Tue, 18 Oct 2011 07:05:59 -0700
From: Mike Dunn <mikedunn@newsguy.com>
MIME-Version: 1.0
To: Angus CLARK <angus.clark@st.com>
Subject: Re: nand_base.c:nand_get_flash_type() test results
References: <4E95B1B4.7040603@st.com> <4E9AEB36.7000806@newsguy.com>
	<4E9D3196.9070104@st.com>
In-Reply-To: <4E9D3196.9070104@st.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: robert.jarzmik@free.fr, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Angus.  Thanks for taking a look and commenting.

On 10/18/2011 12:58 AM, Angus CLARK wrote:
> On 10/16/2011 03:33 PM, Mike Dunn wrote:
>> I am currently grappling with this issue with my driver for the diskonchip G4,
>> which is an MLC nand under the hood, but has a proprietary controller around it
>> which doesn't interact as a "typical" NAND device.  Specific to this topic, it
>> doesn't respond to NAND_READID commands.  My solution was to skip the call to
>> nand_scan_ident(), which calls nand_get_flash_type().  Instead, I do all the
>> initializations done by nand_get_flash_type() within my driver. 
>>
>> Any thoughts or suggestions appreciated.
>>
> I am not familiar with the diskonchip technology but I had a quick look through
> the patch you posted a few days ago.  What you have done regarding
> nand_scan_ident() is probably the most sensible solution here - I believe it was
> this kind of use-case that led to nand_scan() being split into nand_scan_ident()
> and nand_scan_tail().


My guess as well.  The only problem is that, oddly, nand_scan_ident() calls
nand_set_defaults().  So by skipping the cal to nand_scan_ident(), the various
defaut nand methods are not set.  Fortunately, I need to override most of them
anyway, but I did need to duplicate a couple trivial ones in my driver, since
they're not exported from nand_base.c


> An alternative approach would be to fake support for NAND_CMD_READID, similar to
> what you have done for NAND_CMD_STATUS, with subsequent calls to
> chip->read_byte() returning the 'DOCG4_IDREG' sequence {0x04, 0x00, 0xfb, 0xff}.
>  In the same way ONFI devices are handled, you could then add a special case in
> nand_get_flash_type(), say nand_flash_detect_docg4(), jumping to 'ident_done' if
> successful.


I did it this way originally.  But this method requires serving up an arbitrary
unused ID and patching nand_ids.c with a new entry for the arbitrary ID
containing the docg4 parameters.  It was so ugly, I went with the alternate method.


> To be honest, in this case, I don't think there is much to be gained by adding
> 'nand_flash_detect_docg4()' to the generic code.  It would just return some
> hard-coded parameters to serve a single device and driver; you may as well put
> them in the driver itself, as you have done.  On the other hand, if you extend
> it to also handle the other diskonchip varients, that might be more interesting.


Thaks for the suggestion.  Something to keep in mind; Robert Jarzmik is working
on a driver for the diskonchip G3 (which may also support the P3).


Thanks again,
Mike
