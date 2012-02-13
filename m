Received: from mail-wi0-f177.google.com ([209.85.212.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Rx14v-0000DS-F2
 for linux-mtd@lists.infradead.org; Mon, 13 Feb 2012 18:56:46 +0000
Received: by wico1 with SMTP id o1so4270270wic.36
 for <linux-mtd@lists.infradead.org>; Mon, 13 Feb 2012 10:56:43 -0800 (PST)
Date: Mon, 13 Feb 2012 20:56:26 +0200
From: Shmulik Ladkani <shmulik.ladkani@gmail.com>
To: dedekind1@gmail.com
Subject: Re: [PATCH] mtd: unify initialization of erase_info->fail_addr
Message-ID: <20120213205626.55a5c0b3@pixies.home.jungo.com>
In-Reply-To: <1329141796.22240.154.camel@sauron.fi.intel.com>
References: <20120209153629.16bb9b01@pixies.home.jungo.com>
 <1329141752.22240.153.camel@sauron.fi.intel.com>
 <1329141796.22240.154.camel@sauron.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 13 Feb 2012 16:03:16 +0200 Artem Bityutskiy <dedekind1@gmail.com> wrote:
> On Mon, 2012-02-13 at 16:02 +0200, Artem Bityutskiy wrote:
> > On Thu, 2012-02-09 at 15:36 +0200, Shmulik Ladkani wrote:
> > > From: Shmulik Ladkani <shmulik.ladkani@gmail.com>
> > > 
> > > Initialization of 'erase_info->fail_addr' to MTD_FAIL_ADDR_UNKNOWN prior
> > > erase operation is duplicated accross several MTD drivers, and also taken
> > > care of by some MTD users as well.
> > > 
> > > Harmonize it: initialize 'fail_addr' within 'mtd_erase()' interface.
> > > 
> > > Signed-off-by: Shmulik Ladkani <shmulik.ladkani@gmail.com>
> > 
> > Could you please re-send this one and
> > 
> > [PATCH] sfc: mtd: Use MTD_FAIL_ADDR_UNKNOWN instead of 0xffffffff
> > 
> > as a single patch or a series of 2 patches?
> 
> I mean this patch should also patch 'sfc' or just contain that change,
> right?
> 

No, these are independent patches.

'mtd: unify initialization of erase_info->fail_addr' deals with the
duplication of 'fail_addr' initialization accross mtd users and drivers.

'sfc: mtd: Use MTD_FAIL_ADDR_UNKNOWN instead of 0xffffffff' is a bug fix
which I accidentally encountered when grepping 'fail_addr' during the
work on the former patch.
Here we're dealing with an 'erase()' implementation, in the case were
the erase has actually failed, however the 'sfc' driver seems not
capable of stating the location of the failure.
In this case 'fail_addr' should be set to MTD_FAIL_ADDR_UNKNOWN
(which was 0xffffffff ages ago).
Note today 'fail_addr' is a uint64_t, and MTD_FAIL_ADDR_UNKNOWN is -1LL,
meaning 'efx_mtd_erase()' was not adhering to the interface.

Regards
Shmulik
