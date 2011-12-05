Received: from mail-ee0-f49.google.com ([74.125.83.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RXVqC-0002Il-82
 for linux-mtd@lists.infradead.org; Mon, 05 Dec 2011 10:32:09 +0000
Received: by eear49 with SMTP id r49so1745198eea.36
 for <linux-mtd@lists.infradead.org>; Mon, 05 Dec 2011 02:32:06 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1323072677.12068.5.camel@lws-weitzel>
References: <CAN8TOE9=ux=suwcQMwJY1XUhp_mnD_DL613ffF1-HTL1OVB2PQ@mail.gmail.com>
 <1322557213-23565-1-git-send-email-j.weitzel@phytec.de>
 <1322728943.2332.13.camel@koala>
 <CANOLnOOE3a0BP0TcLnRAmq5YAiHLZTpkbriDh9WtkkBT7TotFA@mail.gmail.com>
 <1323072677.12068.5.camel@lws-weitzel>
Date: Mon, 5 Dec 2011 12:32:05 +0200
Message-ID: <CANOLnON=OCtOGr52ZpQKM=z-Ot3zAXeZ-M9eauxaoBkm=PFBLQ@mail.gmail.com>
Subject: Re: [PATCH] mdt nand: omap2+ use platform options
From: Grazvydas Ignotas <notasas@gmail.com>
To: J.Weitzel@phytec.de
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: linux-omap@vger.kernel.org, dedekind1@gmail.com, dedekind@infradead.org,
 linux-mtd@lists.infradead.org, tglx@linutronix.de, computersforpeace@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Dec 5, 2011 at 10:11 AM, Jan Weitzel <J.Weitzel@phytec.de> wrote:
> Sorry, I wasn't carefully enough. I missed 7a559c78 where you removed
> options from struct omap_nand_platform_data. Did you think getting we
> should reintroduce it? I am looking for a good way to get
> NAND_NO_SUBPAGE_WRITE from boardfile to driver.

You could just rename .devsize to .options and use that I guess.


--=20
Gra=C5=BEvydas
