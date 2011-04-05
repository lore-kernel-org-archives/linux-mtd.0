Received: from nbd.name ([46.4.11.11])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q75Eu-0003Cv-A4
	for linux-mtd@lists.infradead.org; Tue, 05 Apr 2011 12:20:08 +0000
Message-ID: <4D9B0951.3030206@openwrt.org>
Date: Tue, 05 Apr 2011 14:21:37 +0200
From: John Crispin <blogic@openwrt.org>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: [PATCH V6] MIPS: lantiq: add NOR flash support
References: <1302005720-8508-1-git-send-email-blogic@openwrt.org>
	<1302005751.2760.116.camel@localhost>
In-Reply-To: <1302005751.2760.116.camel@localhost>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>,
	Ralph Hempel <ralph.hempel@lantiq.com>, linux-mtd@lists.infradead.org,
	Daniel Schwierzeck <daniel.schwierzeck@googlemail.com>,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


> Sorry, but pr_err is defined as follows:
>
> #define pr_err(fmt, ...) \
>         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
>
> You should not add KERN_INFO.
>
>   
Hi,

i missed that one :(
let me resend a fixed version

sorry,
John
