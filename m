Received: from eu1sys200aog108.obsmtp.com ([207.126.144.125])
 by merlin.infradead.org with smtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SaSRg-00067l-0e
 for linux-mtd@lists.infradead.org; Fri, 01 Jun 2012 14:03:16 +0000
Message-ID: <4FC8CBA7.6000702@st.com>
Date: Fri, 01 Jun 2012 15:03:19 +0100
From: Angus CLARK <angus.clark@st.com>
MIME-Version: 1.0
To: Shmulik Ladkani <shmulik.ladkani@gmail.com>
Subject: Re: mtd nand erase and bad block
References: <4FC76039.6020701@sirius-es.it> <4FC771EC.4090500@intel.com>
 <4FC78012.5010704@sirius-es.it> <4FC8601C.5070708@intel.com>
 <Pine.LNX.4.64.1206010837100.4247@lnxricardw.se.axis.com>
 <4FC87D62.6020402@st.com> <1338540121.2536.150.camel@sauron.fi.intel.com>
 <20120601140445.346e322e@halley>
In-Reply-To: <20120601140445.346e322e@halley>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Shmulik,

>>>
>>> Typically, debugfs is only enabled in development environments, and even then it
>>> requires explicit user action, so this method of enabling erasing bad blocks is
>>> safe enough for our needs.
>>
>> Sounds ok to me, especially if you send the patch together with a piece
>> of doc for the mtd web-site. I just think it is important to document
>> this feature. Is this doable?
> 
> I think we should prefer a local "allow erase bad blocks" policy than a
> global one.
> 
> This is because when the global debugfs flag is on, *every* mtd erase
> operation might lead to erasure of bad blocks - not necessarily those
> triggered by the user which set the flag prior issuing his 'flash_erase'
> command.
> 
> Meaning, other MTD users (ubi, various ffs) which currently work on
> other mtd partitions, are suddenly relaxed and allowed to erase bad
> blocks - which is probably not what user intented.
> 
> I suggest to be more restrictive and have the "allow erase bad blocks"
> propery be local policy, that is - per an erase request.
> 
> And since we'll probably need this thing only for userspace erase
> calls (e.g. flash_erase) - I suggest placing it into the MEMERASE ioctl.
> 
> Comments?
> 

I would agree to some extent.  Enabling the "allow erase bad blocks" option per
erase request would certainly be a safer solution.  However, I suspect extending
the existing MEMERASE/MEMERASE64 IOCTLs is not really an option.  That leaves
inventing another IOCTL, or perhaps adding another file mode, which would
achieve per-file-descriptor scope, if not per-erase-request.

My approach was largely motivated by the desire not to change the existing ABI,
and/or mtd-utils.  One could argue that such an option should only ever be
enabled by someone who knows what they are doing, and that might include things
like un-mounting any filesystems beforehand.

To be honest, I am in two minds.  The solution I have at present is very simple
(or perhaps naive!), requires minimial changes to the kernel, no changes to
mtd-utils, and can be disabled completely by not including debugfs (which is
standard practice on production systems).  On the other hand, the ability to
enable per-erase-request is a safer and more elegant solution.  However, it
would require updates to mtd-utils, and agreement from the MTD community
regarding changes to the ABI...

What do you think?

Cheers,

Angus
