Received: from [84.204.75.166] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1FQh1k-0002et-Aj
	for linux-mtd@lists.infradead.org; Tue, 04 Apr 2006 04:36:50 -0400
Message-ID: <44322FF7.80909@yandex.ru>
Date: Tue, 04 Apr 2006 12:36:07 +0400
From: "Artem B. Bityutskiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: Peter J Zhu <peterjzhu@yahoo.com.cn>
References: <20060404020154.30683.qmail@web15103.mail.cnb.yahoo.com>
In-Reply-To: <20060404020154.30683.qmail@web15103.mail.cnb.yahoo.com>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: EBS effect
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Peter J Zhu wrote:
> hello,
>  
>   Recently I enanbled EBS with 2.6.15 on Samsung small
>   page(oobblock = 512B)NAND chip. The results is as
>   following:
>   
>              Without EBS       With EBS
> 
>   Imagesize  31378292B         42379624B
> 
>   Mouttime   17s ~             14s ~
> 
>   The overhead space is too much while providing NOT
>   high mout time improvement But from the thread
>   http://mhonarc.axis.se/jffs-dev/msg01763.html, 
>   results seems too bad compared with what's claimed. 
> 
>   The only diff I can imagine is that he might use big
>   page NAND. Any hints are very much appreciated. 
> 
What's the size of your MTD device?

-- 
Best Regards,
Artem B. Bityutskiy,
St.-Petersburg, Russia.
