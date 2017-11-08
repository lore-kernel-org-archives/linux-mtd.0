Received: from mail-wr0-x22a.google.com ([2a00:1450:400c:c0c::22a])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eCN6r-0001gg-T9
 for linux-mtd@lists.infradead.org; Wed, 08 Nov 2017 09:57:28 +0000
Received: by mail-wr0-x22a.google.com with SMTP id o88so1852282wrb.6
 for <linux-mtd@lists.infradead.org>; Wed, 08 Nov 2017 01:57:04 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <697aaad0-f27a-db45-08d0-e23f6bec7873@pengutronix.de>
References: <697aaad0-f27a-db45-08d0-e23f6bec7873@pengutronix.de>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Wed, 8 Nov 2017 10:57:02 +0100
Message-ID: <CAFLxGvzWQaHxBdK95h=Lb9qeemcQWOsuYkVLGZwomgc1EaMoXA@mail.gmail.com>
Subject: Re: quota support
To: Marc Kleine-Budde <mkl@pengutronix.de>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Dongsheng Yang <yangds.fnst@cn.fujitsu.com>, dongsheng.yang@easystack.cn
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Marc,

On Tue, Nov 7, 2017 at 8:16 PM, Marc Kleine-Budde <mkl@pengutronix.de> wrote:
> Hello,
>
> as fas as I can see UBIFS doesn't support quota yet, is anyone working
> on UBIFS quota support?
>
> Dongsheng Yang posted a quota patch series some time ago, is this the
> newest series https://github.com/yangdongsheng/linux/tree/ubifs_quota_v3 ?

AFAIK I was not really happy with the series because it did not
support project quotas
and had some issues with being power-cut tolerant.
VFS folks also had concerns since the quota subsystem assumes a block
device but UBIFS
works on top of a character device. This needs to be addressed is a
sane way too.

-- 
Thanks,
//richard
