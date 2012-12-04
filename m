Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Tfobl-0002uC-1P
 for linux-mtd@lists.infradead.org; Tue, 04 Dec 2012 09:16:06 +0000
Date: Tue, 4 Dec 2012 10:15:59 +0100
From: Richard Weinberger <richard@nod.at>
To: dedekind1@gmail.com
Subject: Re: [PATCH 2/2] ubi: Dont call ubi_self_check_all_ff() in
 __wl_get_peb()
Message-ID: <20121204101559.37d83d28@spider.haslach.nod.at>
In-Reply-To: <1354608901.11583.56.camel@sauron.fi.intel.com>
References: <1354548780.11583.21.camel@sauron.fi.intel.com>
 <1354564667-9549-1-git-send-email-richard@nod.at>
 <1354564667-9549-3-git-send-email-richard@nod.at>
 <1354607777.11583.50.camel@sauron.fi.intel.com>
 <1354608901.11583.56.camel@sauron.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, zsadecki@itwatchdogs.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am Tue, 04 Dec 2012 10:15:01 +0200
schrieb Artem Bityutskiy <dedekind1@gmail.com>:

> On Tue, 2012-12-04 at 09:56 +0200, Artem Bityutskiy wrote:
> > On Mon, 2012-12-03 at 20:57 +0100, Richard Weinberger wrote:
> > > As ubi_self_check_all_ff() might sleep we are not allowed
> > > to call it from atomic context.
> > > For now we call it only from ubi_wl_get_peb().
> > > There are some code paths where it would also make sense,
> > > but these paths are currently atomic and only enabled
> > > when fastmap is used.
> > > 
> > > Signed-off-by: Richard Weinberger <richard@nod.at>
> > 
> > Can you confirm that you enabled the 3 debugging options I sent and
> > tested both FM and non-FM configurations with those options enabled?
> 
> Let me elaborate why I am asking.
> 
> 1. If you did the tests and with this fix the debugging stuff works
> fine, then it is OK to take this patch now and let you improve the FM
> debugging coverage a bit later.

Of course I did the tests.
Namely chk_gen, chk_io, tst_emulate_bit_flips and tst_disable_bgt.
(Also in various combinations)

Please note, there is one issue regarding tst_disable_bgt and fastmap.
Fastmap needs the UBI background thread. Therefore ubi-tests fail if
fastmap is enabled and tst_disable_bgt=1.
For 3.8 I can try to rework my code such that the test passes...
But IMHO the tst_disable_bgt test is useless.

I'll rework the fastmap code paths such that ubi_self_check_all_ff()
can be used everywhere. This is planned for 3.8.
As we are at 3.7-rc8 now I get very nervous if I have to touch
much UBI/fastmap code.

Again, with CONFIG_MTD_UBI_FASTMAP=n I'm no longer able to reproduce
any UBI regression.
If there is still a regression, please report it to me I'll fix it
immediately.

Thanks,
//richard
