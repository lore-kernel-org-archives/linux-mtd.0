Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1eMDG3-0000dw-Gz
 for linux-mtd@lists.infradead.org; Tue, 05 Dec 2017 13:27:38 +0000
From: Richard Weinberger <richard@nod.at>
To: Manfred Spraul <manfred@colorfullife.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: UBIFS does not mount after powerfail
Date: Tue, 05 Dec 2017 14:27:36 +0100
Message-ID: <24015049.MUjmLyMSVC@blindfold>
In-Reply-To: <df8dc8e7-cb9a-4cef-bca6-cfc40092b1d1@colorfullife.com>
References: <195075f7-01f8-58d2-ba1c-4291e62a39cc@colorfullife.com>
 <2908877.jEbli3qftF@blindfold>
 <df8dc8e7-cb9a-4cef-bca6-cfc40092b1d1@colorfullife.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Manfred,

Am Freitag, 1. Dezember 2017, 08:41:28 CET schrieb Manfred Spraul:
> >> Image after that command:
> >> https://sourceforge.net/projects/calculix-rpm/files/ubifs/image-168169.bi
> >> n/d ownload
> > 
> > Which file contains the MTD with chk_fs being enabled?
> 
> I'm not sure if this help, it only adds more data that will confuse:
> The image.bin is obviously identical, I have only enabled chk_fs for the
> replay.
> 
> And: The mount was done using 4.14, the image was created using 4.14-rc5.
> If you want: Here is the data (dmesg output + images)
> https://sourceforge.net/projects/calculix-rpm/files/ubifs/chkfs_4.14/

I still don't get which Image is the right one.
I gave image-168167.bin a try, but it contains many errors, I'm not sure
if it contains the first error.

So, which file do I need to download to get the image that contains the first 
error as detected by chk_fs?

The mode of operation of your tool should be:
1. Mount UBIFS
2. Do various filesystem operations
3. Random power-cut (in software)
4. Dump the image to a file X
5. Set chk_fs to 1
6. Mount it again
7. If mount succeeds, drop X, umount and goto 1
   Else if, chk_fs finds a problem. Store file X.

I want file X. :-)

Thanks,
//richard
