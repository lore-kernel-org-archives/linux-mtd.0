Received: from mo-p05-ob.rzone.de ([81.169.146.182])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Pd0i4-0006TK-2r
	for linux-mtd@lists.infradead.org; Wed, 12 Jan 2011 13:25:56 +0000
From: Stefan Roese <sr@denx.de>
To: "Dmitry Eremin-Solenikov" <dbaryshkov@gmail.com>
Subject: Re: [PATCH 1/5] MTD: make MTD_CONCAT support mandatory
Date: Wed, 12 Jan 2011 14:25:49 +0100
References: <1294745619-7142-1-git-send-email-dbaryshkov@gmail.com>
In-Reply-To: <1294745619-7142-1-git-send-email-dbaryshkov@gmail.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201101121425.49587.sr@denx.de>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
	Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tuesday 11 January 2011 12:33:35 Dmitry Eremin-Solenikov wrote:
> Move mtdconcat to be an integral part of the mtd core. It's a tiny bit
> of code, which bears 'say Y if you don't know what to do' note in the
> Kconfig. OTOH there are several ugly ifdefs depending on the MTD_CONCAT.
> So, making MTD_CONCAT support mandatory will allow us to clean up code a
> lot.
> 
> Kconfig entry is changed to be a bool defaulting to Y, so all code
> pieces depending on it, will have MTD_CONCAT Kconfig symbol and
> CONFIG_MTD_CONCAT define. This will be removed in one of next patches.

Whole patch series looks good. Thanks. I'm not sure if it makes more sense to 
squash the MTD patches into one patch. Either way I'm fine with it, so:

Acked-by: Stefan Roese <sr@denx.de>

for the whole patch series.
 
Cheers,
Stefan
