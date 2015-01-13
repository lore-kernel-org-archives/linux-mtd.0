Received: from mail-la0-x22f.google.com ([2a00:1450:4010:c03::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YB9aC-0007hl-Di
 for linux-mtd@lists.infradead.org; Tue, 13 Jan 2015 22:05:05 +0000
Received: by mail-la0-f47.google.com with SMTP id hz20so5110311lab.6
 for <linux-mtd@lists.infradead.org>; Tue, 13 Jan 2015 14:04:42 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20150113215817.GW9759@ld-irv-0074>
References: <1420626727-6929-1-git-send-email-festevam@gmail.com>
 <1420626727-6929-2-git-send-email-festevam@gmail.com>
 <20150109201743.GW9759@ld-irv-0074>
 <CAOMZO5BaEyU=qJfCsng+kPBcWSxb6wgJzzahgYvHn5Fqi_uoWA@mail.gmail.com>
 <20150113185153.GT9759@ld-irv-0074>
 <CAOMZO5Cy39iC0CpvO0H6i6rX6YVyns-2tZi5-vU28hCM6kgu-w@mail.gmail.com>
 <20150113215817.GW9759@ld-irv-0074>
Date: Tue, 13 Jan 2015 20:04:42 -0200
Message-ID: <CAOMZO5BBgyDvWh+nJ4VEqOo5jwNE2hRPCymYo7bqX2tpSxh7Vw@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] mtd: fsl-quadspi: Fix module unbound
From: Fabio Estevam <festevam@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: Fabio Estevam <fabio.estevam@freescale.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 b45815@freescale.com, Huang Shijie <shijie8@gmail.com>,
 Frank Li <Frank.Li@freescale.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Brian,

On Tue, Jan 13, 2015 at 7:58 PM, Brian Norris
<computersforpeace@gmail.com> wrote:

> Right, I thought your original patch was an improvement, but it did
> still leave some of the error path broken. And as Huang mentioned,
> multiple devices were never actually *properly* supported, so there were
> problems there.
>
>> I agree that this driver needs more rework, but I am not able to put
>> it on such good state.
>
> I might be OK with taking v1 if we can do the following:

Sounds like a good deal, thanks.

>
> (1) Identify who will take responsibility for testing and improving this
> driver. We might even add a MAINTAINERS entry

Frank or Allen, would any of you be interested in becoming the
maintainer of fsl-quadspi?

> (2) Get an 'ack' from said person

I will resend v1 with everyone on Cc.

> (3) Document the known issues with this driver; add some TODO/FIXME
> comments, and maybe disable potentially broken features until they get
> fixed (e.g., only probe up to 1 flash, leaving the second flash
> disabled)

Frank/Allen/Huang, could you please prepare such patch?

Thanks,

Fabio Estevam
