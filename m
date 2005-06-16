Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DioQs-00062D-9S
	for linux-mtd@lists.infradead.org; Thu, 16 Jun 2005 03:04:59 -0400
Message-ID: <42B12463.4060106@yandex.ru>
Date: Thu, 16 Jun 2005 11:04:03 +0400
From: "Artem B. Bityuckiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: zhao <forrest.zhao@intel.com>
References: <8126E4F969BA254AB43EA03C59F44E840263CEAE@pdsmsx404>	<1118827313.22181.52.camel@hades.cambridge.redhat.com>
	<42B11054.4020509@intel.com>
In-Reply-To: <42B11054.4020509@intel.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
Subject: Re: jffs2 corrupt rarely, how to fix it?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

zhao wrote:
> Would you please give me some information about the difference
> between the JFFS2 in 2.4 kernel and the one in 2.6 kernel?

One substantial difference is the absence of the lookup() inode operation
in <= 2.4.19 kernels.

AFAIK, there are no major problems porting recent MTD trees to "not very 
ancient" 2.4 kernels, where "not very ancient" is, I presume, > 2.4.20. 
But I didn't try (thank goodness) :-) People just don't want to deal 
with old stuff anymore.

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
