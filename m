Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 154ejf-0006N6-00
	for <linux-mtd@lists.infradead.org>; Tue, 29 May 2001 09:20:15 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <sb13d79c.074@mail.microbits.com.au> 
References: <sb13d79c.074@mail.microbits.com.au> 
To: "Daniel Cox" <DCox@microbits.com.au>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Grub 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 29 May 2001 09:24:16 +0100
Message-ID: <19508.991124656@redhat.com>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

DCox@microbits.com.au said:
> There is no patch for .5.96 and I cant find grub .5.97!

There appears to be a 'grub-0.5.96-doc.patch' in my working directory. I've 
committed it. 

0.5.97 is what the current CVS version is called, I think.


> However even with the --enable-diskonchip option for ./configure, root
> (dc0) does not work - selected disk does not exist! For now I am
> running from a hard disk (hd0). 

Does it even print the messages about probing for a DiskOnChip?

DCox@microbits.com.au said:
>  Once the firmware is installed, the following appears
>   Could not find valid boot record
>   Could not mount NFTL device

Argh. I've been seeing a lot of that recently. Something in the sanity 
checks is failing. I'll put some more verbose messages in.


DCox@microbits.com.au said:
>  nftl_format works but removes the firmware. 

Give it an offset and it'll skip the firmware.
	nftl_format /dev/mtd0 49152


DCox@microbits.com.au said:
>  How can I get the firmware installed along with a formatted
> partition? 

If you mean the original firmware, then you have to do that from DOS with
DFORMAT. If you mean Grub, then install Grub as before (having fixed it) 
and then use nftl_format with an offset of (IIRC) 65536.


DCox@microbits.com.au said:
>  How can I access the DOC device from Grub? 

The Grub support was never 100% completed. It worked to a certain extent but
wasn't reliable. I never got time to debug it, although it should be
relatively simple. It seemed that the first time you read a sector it would
return incorrect data. The next time it would work. So repeating the
'kernel=' command a few times till Grub stopped complaining about errors,
and then booting, worked. 


>  Does JFFS work with the DOC? I read the archive and it was recently
> mentioned that it does not work.

The DiskOnChip hardware driver only accepts write requests of a single 
page. It needs to be fixed to allow larger writes - to loop till it's done.
At that point, you should be able to use JFFS on it, although you only have 
error detection, not error _correction_. The ideal solution is to add the 
planned ECC support to JFFS2 and use that.

--
dwmw2
