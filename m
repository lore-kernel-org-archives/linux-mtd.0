MIME-Version: 1.0
In-Reply-To: <4FE83A66.9090100@atmel.com>
References: <1339567570-4816-1-git-send-email-josh.wu@atmel.com>
 <4FE13CB2.3000605@atmel.com>
 <CAN8TOE8iDtzw4eTKa6tJ5oBxbaDUxg9nDLaKBhW4D86vGWxGJg@mail.gmail.com>
 <4FE29CB8.3000404@atmel.com>
 <CAN8TOE9ebFAfJHaG2-po0LeLi=wTq9YZ9pNFXhQE0PLt5TQxeg@mail.gmail.com>
 <4FE83A66.9090100@atmel.com>
Date: Mon, 2 Jul 2012 09:39:49 -0700
Message-ID: <CAN8TOE8LNQSeFW2G_xmeSxz-PvqLcW_WtJMjt5bLnwsz2pAA4g@mail.gmail.com>
Subject: Re: [RFC PATCH v2] MTD: nand: add return value for
 write_page()/write_page_raw() functions in structure of nand_ecc_ctrl.
From: Brian Norris <computersforpeace@gmail.com>
To: Josh Wu <josh.wu@atmel.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: bryan.wu@analog.com, jack.lan@freescale.com,
 Mike Dunn <mikedunn@newsguy.com>, nick.spence@freescale.com,
 dedekind1@gmail.com, tie-fei.zang@freescale.com, linux-mtd@lists.infradead.org,
 scottwood@freescale.com, Dipen.Dudhat@freescale.com, tglx@linutronix.de,
 dwmw2@infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Jun 25, 2012 at 3:16 AM, Josh Wu <josh.wu@atmel.com> wrote:
> According to your advice, I resent a new patch series, which merge this
> patch with PMECC.

Thanks, it looks good.

BTW, this affects Mike Dunn, who was planning on touching the docg4.c
portion. Mike: note that the write_page() functions in docg4.c have
been changed to fix the "error" we were discussing with return codes
(see l2-mtd-2.6.git).

Brian
