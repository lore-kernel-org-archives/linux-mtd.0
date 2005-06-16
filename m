Received: from fmr15.intel.com ([192.55.52.69] helo=fmsfmr005.fm.intel.com)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DiqOu-0006oD-9z
	for linux-mtd@lists.infradead.org; Thu, 16 Jun 2005 05:11:05 -0400
Message-ID: <42B14245.7070500@intel.com>
Date: Thu, 16 Jun 2005 17:11:33 +0800
From: zhao <forrest.zhao@intel.com>
MIME-Version: 1.0
To: "Artem B. Bityuckiy" <dedekind@yandex.ru>
References: <8126E4F969BA254AB43EA03C59F44E840263CEAE@pdsmsx404>	<1118827313.22181.52.camel@hades.cambridge.redhat.com>
	<42B11054.4020509@intel.com> <42B12463.4060106@yandex.ru>
In-Reply-To: <42B12463.4060106@yandex.ru>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
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

Artem B. Bityuckiy wrote:

> zhao wrote:
>
>> Would you please give me some information about the difference
>> between the JFFS2 in 2.4 kernel and the one in 2.6 kernel?
>
>
> One substantial difference is the absence of the lookup() inode operation
> in <= 2.4.19 kernels.
>
> AFAIK, there are no major problems porting recent MTD trees to "not 
> very ancient" 2.4 kernels, where "not very ancient" is, I presume, > 
> 2.4.20. But I didn't try (thank goodness) :-) People just don't want 
> to deal with old stuff anymore.
>
In fact, we were using JFFS2 on kernel 2.4.10.......
And we encountered some problems(e.g. jffs2 corrupt rarely), it seems 
that I need to
back-port JFFS2 in latest 2.4 kernel(2.4.31, right?) to 2.4.10 :( if 
they are not willing
to upgrade to latest 2.4 kernel in the product.

Thanks,
Forrest
