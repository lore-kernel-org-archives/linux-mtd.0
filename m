Received: from mail-bk0-f49.google.com ([209.85.214.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SePwD-0002ux-F2
 for linux-mtd@lists.infradead.org; Tue, 12 Jun 2012 12:11:14 +0000
Received: by bkwj4 with SMTP id j4so5531811bkw.36
 for <linux-mtd@lists.infradead.org>; Tue, 12 Jun 2012 05:11:05 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <4875438356E7CA4A8F2145FCD3E61C0B2CD8AD332F@MEP-EXCH.meprolight.com>
References: <4875438356E7CA4A8F2145FCD3E61C0B2CD8AD332F@MEP-EXCH.meprolight.com>
Date: Tue, 12 Jun 2012 09:11:05 -0300
Message-ID: <CAOMZO5A1xPzQs_7qMBPYJAPBu1OYc0wTRtibn-Kfu4=P6STgGA@mail.gmail.com>
Subject: Re: mtd mxc_nand: mx35 kernel panic during request to read Device ID
From: Fabio Estevam <festevam@gmail.com>
To: Alex Gershgorin <alexg@meprolight.com>
Content-Type: text/plain; charset=UTF-8
Cc: "artem.bityutskiy@linux.intel.com" <artem.bityutskiy@linux.intel.com>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "u.kleine-koenig@pengutronix.de" <u.kleine-koenig@pengutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Alex,

On Tue, Jun 12, 2012 at 7:35 AM, Alex Gershgorin <alexg@meprolight.com> wrote:
> Hi everybody,
>
> In kernel 3.4, I have not encountered this problem

Please try this patch:
https://lkml.org/lkml/2012/6/8/366
