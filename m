From: David Woodhouse <dwmw2@infradead.org>
To: "Artem B. Bityuckiy" <abityuckiy@yandex.ru>
In-Reply-To: <4175065B.6040407@yandex.ru>
References: <417156E1.9000009@yandex.ru> <4173AFAE.6060303@inf.u-szeged.hu>
	<4173B404.6040100@yandex.ru> <4174C8EF.50604@inf.u-szeged.hu>
	<4174D508.8050508@yandex.ru> <4174E7D3.9050706@inf.u-szeged.hu>
	<4174F0F3.7030604@yandex.ru> <4175035B.80101@inf.u-szeged.hu>
	<4175065B.6040407@yandex.ru>
Content-Type: text/plain
Message-Id: <1098193380.13633.1099.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Tue, 19 Oct 2004 14:43:01 +0100
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS2 compression
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2004-10-19 at 16:19 +0400, Artem B. Bityuckiy wrote:
> Ferenc, thanks for story, I really interested why the proc support was 
> removed. 

It was buggy. There were buffer overflows and similar problems with it.
I dropped it and suggested that the reimplementation may as well use
sysfs.

-- 
dwmw2
