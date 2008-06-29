Received: from mx02.mailboxcop.com ([206.125.223.72])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KCyWA-00059i-L2
	for linux-mtd@lists.infradead.org; Sun, 29 Jun 2008 15:08:42 +0000
Received: from secure3.apollohosting.com (secure3.apollohosting.com
	[206.125.215.253])
	by mx02.mailboxcop.com (8.13.8/8.13.8) with ESMTP id m5TF8bp0020430
	for <linux-mtd@lists.infradead.org>; Sun, 29 Jun 2008 10:08:37 -0500
Message-ID: <20080629100837.4jm8veu1c5s8kos4@webmail.mistralsolutions.com>
Date: Sun, 29 Jun 2008 10:08:37 -0500
From: suresh@mistralsolutions.com
To: Sudeep K N <sudeepholla.maillist@gmail.com>
Subject: Re: JFFS2 Cleanmarker Issue
References: <4856F1F7.4040003@mistralsolutions.com>
	<366f00c80806161827q46a5ea2bmc0e51f5c4d6c96ec@mail.gmail.com>
	<48580867.6030403@mistralsolutions.com>
	<366f00c80806290452r6d55feb5w49ab0fb70315a206@mail.gmail.com>
In-Reply-To: <366f00c80806290452r6d55feb5w49ab0fb70315a206@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset=ISO-8859-1;
	DelSp="Yes";
	format="flowed"
Content-Disposition: inline
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi

Quoting Sudeep K N <sudeepholla.maillist@gmail.com>:
> No cleanmarker doesnot always start from 1st byte
> The position of cleanmarker depends on the oobfree area specified by
> you through
> struct nand_ecclayout
>
> --
> Regards,
> Sudeep

I think I found the reason for the issue. I forgot to mention that we  
are using oneNAND. OneNAND uses the fragmented OOB, which I think is  
not supported by Jffs2 and oneNAND driver in 2.6.16-rc3.

Thanks,
Suresh
