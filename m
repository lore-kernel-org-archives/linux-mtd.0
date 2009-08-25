Received: from qmta12.emeryville.ca.mail.comcast.net ([76.96.27.227])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Mfouz-0004Sn-GH
	for linux-mtd@lists.infradead.org; Tue, 25 Aug 2009 05:50:09 +0000
Message-ID: <4A937B7A.4070609@gmail.com>
Date: Mon, 24 Aug 2009 22:49:46 -0700
From: Norman Cheung <brjerome.1@gmail.com>
MIME-Version: 1.0
To: Radha Mohan <radhamohan_ch@yahoo.com>
Subject: Re: Write to NOR flash garbled
References: <c260b4940908241158m5565f682ped4a908c6998cef8@mail.gmail.com>
	<231717.78385.qm@web94806.mail.in2.yahoo.com>
In-Reply-To: <231717.78385.qm@web94806.mail.in2.yahoo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Reply-To: brjerome.1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

There was no error.  However, reading the content after the write shows 
that the data was corrupted. Putting a delay after the write seems to 
solve the problem. 

It seems that the chip_ready() in do_write_buffer() is returning 
prematurely.  According to Spansion's spec. chip_ready() should check 
DQ7.  But chip_ready() read the same location and if they are the same, 
it assumes that chip is ready.

Norman

Radha Mohan wrote:
> hi,
>
> Can you list out the errors that you are getting? 
> I also faced some problem with Spansion S29GL064M90TAIR4NOR flash. In my case the
> sector erase was not happening immediately after giving the command. So with that I saw
> some Data CRC and Node CRC errors.
> So I put a retry in the code where erase was failing (cfi_cmdset0002.c). And also I disabled
> the buffered write.
>
> -- Mohan
>
>
>
> ----- Original Message ----
> From: N Cheung <brjerome.1@gmail.com>
> To: linux-mtd@lists.infradead.org
> Sent: Tuesday, 25 August, 2009 12:28:28 AM
> Subject: Write to NOR flash garbled
>
> This device, a Micrel KS8695 based system with Linux 2.6.18 with AMD
> Am29LV641DH.  Device running find for 2 years until switch to a
> compatible Spansion NOR flash S29GL064N.
>
> flashcp failed with error: File does not seem to match flash data.
> First mismatch at 0x00000000-0x00002800
>
> Use dd to copy a one line text file, we can read it back OK.  But with
> a bigger (200 lines) text file, the data get garbled.
>
> However, if MTD debug is set to verbosity=3, flashcp copied big files
> without problem.
>
> Any pointers will be greatly appreciated.
>
> Thanks in advance,
> Norman
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
>
>
>       Looking for local information? Find it on Yahoo! Local http://in.local.yahoo.com/
>
>
>   
