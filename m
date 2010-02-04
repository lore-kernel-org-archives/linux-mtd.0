Received: from mail.windriver.com ([147.11.1.11])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Ncw05-0006ur-Aq
	for linux-mtd@lists.infradead.org; Thu, 04 Feb 2010 07:19:45 +0000
Received: from ALA-MAIL03.corp.ad.wrs.com (ala-mail03 [147.11.57.144])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id o147JeTZ026064
	for <linux-mtd@lists.infradead.org>;
	Wed, 3 Feb 2010 23:19:40 -0800 (PST)
Message-ID: <4B6A767F.3040106@windriver.com>
Date: Thu, 04 Feb 2010 15:25:51 +0800
From: "stanley.miao" <stanley.miao@windriver.com>
MIME-Version: 1.0
To: "Stanley.Miao" <stanley.miao@windriver.com>
Subject: Re: Fix mtd-utils bugs
References: <1265172354-26682-1-git-send-email-stanley.miao@windriver.com>
In-Reply-To: <1265172354-26682-1-git-send-email-stanley.miao@windriver.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

BTW, because ECCGETLAYOUT was added in 2.6.17, so these patches will 
break on
linux kernel prior to 2.6.17.

Stanley.

Stanley.Miao wrote:
> (Re-send it because the previous one don't have a subject.)
>
> During some BSP development process, I found some tools in mtd-utils
> contain legacy interfaces and it is not suitable with the current linux
> kernel. I post my patches here in case somebody else need them.
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
>   
