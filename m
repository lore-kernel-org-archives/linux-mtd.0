Received: from mail-bk0-f49.google.com ([209.85.214.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SeRnF-0001xU-QR
 for linux-mtd@lists.infradead.org; Tue, 12 Jun 2012 14:10:02 +0000
Received: by bkwj4 with SMTP id j4so5660316bkw.36
 for <linux-mtd@lists.infradead.org>; Tue, 12 Jun 2012 07:09:59 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <4875438356E7CA4A8F2145FCD3E61C0B2CD8AD3331@MEP-EXCH.meprolight.com>
References: <4875438356E7CA4A8F2145FCD3E61C0B2CD8AD332F@MEP-EXCH.meprolight.com>
 <CAOMZO5A1xPzQs_7qMBPYJAPBu1OYc0wTRtibn-Kfu4=P6STgGA@mail.gmail.com>
 <4875438356E7CA4A8F2145FCD3E61C0B2CD8AD3331@MEP-EXCH.meprolight.com>
Date: Tue, 12 Jun 2012 11:09:59 -0300
Message-ID: <CAOMZO5AfpkM5Xa_qozi60517AjEAV-cYnj2hsmwecdcyxPoKcg@mail.gmail.com>
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

On Tue, Jun 12, 2012 at 9:25 AM, Alex Gershgorin <alexg@meprolight.com> wrote:

> I applied this patch, but unfortunately I got the same result

Could you please run git bisect to figure out the commit that is
causing the oops?
