Received: from ftp.meprolight.com ([194.90.149.17] helo=meprolight.com)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SeSRz-00082b-6V
 for linux-mtd@lists.infradead.org; Tue, 12 Jun 2012 14:52:08 +0000
From: Alex Gershgorin <alexg@meprolight.com>
To: Fabio Estevam <festevam@gmail.com>
Date: Tue, 12 Jun 2012 17:50:54 +0300
Subject: RE: mtd mxc_nand: mx35 kernel panic during request to read Device	ID
Message-ID: <4875438356E7CA4A8F2145FCD3E61C0B2CD8AD3333@MEP-EXCH.meprolight.com>
References: <4875438356E7CA4A8F2145FCD3E61C0B2CD8AD332F@MEP-EXCH.meprolight.com>
 <CAOMZO5A1xPzQs_7qMBPYJAPBu1OYc0wTRtibn-Kfu4=P6STgGA@mail.gmail.com>
 <4875438356E7CA4A8F2145FCD3E61C0B2CD8AD3331@MEP-EXCH.meprolight.com>,
 <CAOMZO5AfpkM5Xa_qozi60517AjEAV-cYnj2hsmwecdcyxPoKcg@mail.gmail.com>
In-Reply-To: <CAOMZO5AfpkM5Xa_qozi60517AjEAV-cYnj2hsmwecdcyxPoKcg@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
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




> I applied this patch, but unfortunately I got the same result

> > Could you please run git bisect to figure out the commit that is
> > causing the oops?

I'll try to do it tomorrow, unfortunately I have no time today

Regards,
Alex
