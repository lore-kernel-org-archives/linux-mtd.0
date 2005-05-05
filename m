Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DTiSM-0002Jb-7z
	for linux-mtd@lists.infradead.org; Thu, 05 May 2005 11:40:07 -0400
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: Murali Sampath <msampath@Ai-Logix.com>
In-Reply-To: <B2627A2E13B6DE4BADE1746A7DFBFA7E07B7C3@aimsg.corp.audiocodes.com>
References: <B2627A2E13B6DE4BADE1746A7DFBFA7E07B7C3@aimsg.corp.audiocodes.com>
Content-Type: text/plain
Date: Thu, 05 May 2005 19:39:36 +0400
Message-Id: <1115307576.27158.2.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, "Burch, John T." <John.Burch@tellabs.com>
Subject: Re: Jffs2Mount Issue.
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> I am using the Uboot and Kernel is 2.4.27 and also I have AMD29LV640 flash device. I get the jffs2_scan_erase_block errors.
> I am stuck not able to get JFFS2 to work right. Any suggestions will  be
> greatly appreciated. I have no problem in using NFS. 
The messages mean that you have garbage on your Flash, instead of valid
JFFS2 image.

Please, describe how did you copy your JFFS2 FS image to your flash.

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
