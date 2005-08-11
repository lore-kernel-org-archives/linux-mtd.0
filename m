Received: from mx3.mail.ru ([194.67.23.149])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1E3855-00015H-2I
	for linux-mtd@lists.infradead.org; Thu, 11 Aug 2005 04:06:34 -0400
Message-ID: <42FB0734.7050304@mail.ru>
Date: Thu, 11 Aug 2005 12:07:16 +0400
From: Alex Karev <lineum@mail.ru>
MIME-Version: 1.0
To: dedekind@infradead.org
References: <42FAFEC9.1090306@mail.ru>
	<1123745980.16052.48.camel@sauron.oktetlabs.ru>
In-Reply-To: <1123745980.16052.48.camel@sauron.oktetlabs.ru>
Content-Type: text/plain; charset=KOI8-R; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: jffs2 and nand mtd
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem B. Bityuckiy wrote:

>On Thu, 2005-08-11 at 11:31 +0400, Alex Karev wrote:
>  
>
>>Hello
>>
>>While we mount empty jffs2 and then copying  files it's ok, after 
>>remount/reboot. the files have zero gaps ~2kb at some (stable?) 
>>locations, and filesytem is broken that way.
>>install procedure following:
>>
>>#flash_eraseall -j /dev/mtd0
>>#mount -t jffs2 /dev/mtdblock0 /mnt
>>#cp ...
>>    at this stage files looks ok.
>>#umount
>>#mount
>>    zero gaps appear in data on flash and lot of debug info with some 
>>Eeps, sometimes kernel panic.
>>    
>>
>Hmm, could you please report which MTD snapshot do you use (date) ?
>
>  
>
We don't know how to find real date of snapshot but
we follow stages for 2.4 kernels mentioned in 
http://www.linux-mtd.infradead.org/source.html#kernelversions

/...
cd mtd/
/cvs update -dP -D 2005-03-04

And then apply some patch which we found at list archive to make  
*getlink* works for JFFS2.



/
