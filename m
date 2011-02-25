Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PstUp-0002J7-37
	for linux-mtd@lists.infradead.org; Fri, 25 Feb 2011 08:57:56 +0000
Received: by wyf23 with SMTP id 23so1446974wyf.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 25 Feb 2011 00:57:53 -0800 (PST)
Subject: RE: [PATCH v4 1/2] mtd: NOR flash driver for OMAP-L137/AM17x
From: Artem Bityutskiy <dedekind1@gmail.com>
To: "Rajashekhara, Sudhakar" <sudhakar.raj@ti.com>
In-Reply-To: <B85A65D85D7EB246BE421B3FB0FBB5930248AAF048@dbde02.ent.ti.com>
References: <1291111325-25784-1-git-send-email-savinay.dharmappa@ti.com>
	<1291261815.14534.14.camel@koala>
	<B85A65D85D7EB246BE421B3FB0FBB5930248AAF048@dbde02.ent.ti.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 25 Feb 2011 10:56:29 +0200
Message-ID: <1298624189.2798.15.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: "davinci-linux-open-source@linux.davincidsp.com"
	<davinci-linux-open-source@linux.davincidsp.com>,
	Aleksey Makarov <amakarov@ru.mvista.com>,
	Sergei Shtylyov <sshtylyov@ru.mvista.com>,
	David Griego <dgriego@mvista.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"Dharmappa, Savinay" <savinay.dharmappa@ti.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2011-02-16 at 17:19 +0530, Rajashekhara, Sudhakar wrote:
> Hi,
> 
> On Thu, Dec 02, 2010 at 09:20:15, Artem Bityutskiy wrote:
> > On Tue, 2010-11-30 at 15:32 +0530, Savinay Dharmappa wrote:
> > > From: David Griego <dgriego@mvista.com>
> > > 
> > > OMAP-L137/AM17x has limited number of dedicated EMIFA address pins, 
> > > enough to interface directly to an SDRAM.
> > > If a device such as an asynchronous flash needs to be attached to the 
> > > EMIFA, then either GPIO pins or a chip select may be used to control 
> > > the flash device's upper address lines.
> > > 
> > > This patch adds support for the NOR flash on the OMAP-L137/ AM17x user 
> > > interface daughter board using the latch-addr-flash MTD mapping driver 
> > > which allows flashes to be partially physically addressed. The upper 
> > > address lines are set by a board specific code which is a separate 
> > > patch.
> > > 
> > > Signed-off-by: David Griego <dgriego@mvista.com>
> > > Signed-off-by: Aleksey Makarov <amakarov@ru.mvista.com>
> > > Signed-off-by: Sergei Shtylyov <sshtylyov@ru.mvista.com>
> > > Signed-off-by: Savinay Dharmappa <savinay.dharmappa@ti.com>
> > 
> > Pushed these to l2-mtd-2.6.git, thanks.
> > 
> 
> I do not see these patches in Linus's tree [1] or at l2-mtd-2.6.git tree [2].
> Is there any tree where these patches are available?
> 
> [1] git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux-2.6.git
> [2] git://git.infradead.org/users/dedekind/l2-mtd-2.6.git

Hmm, sorry, I do not know how what happened to this patch and where it
was lost. I've just re-added it to my tree. Apologies.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
