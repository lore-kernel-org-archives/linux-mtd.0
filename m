Received: from gw1.transmode.se ([195.58.98.146])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TK46Y-0002nS-PH
 for linux-mtd@lists.infradead.org; Fri, 05 Oct 2012 09:21:59 +0000
In-Reply-To: <OF860E68DA.97A53995-ONC1257A8E.003297E0-C1257A8E.003308E2@rohde-schwarz.com>
References: <OFB9AE3BAC.A5615989-ONC1257A8A.0032CA58-C1257A8B.004EAAA5@rohde-schwarz.com>
 <OF52EBAA51.F623F8FB-ONC1257A8B.005B88EA-C1257A8B.005BD53C@transmode.se>
 <OFF2FAA55C.4813D4C0-ONC1257A8B.0060F9EA-C1257A8B.00634CA4@transmode.se>
 <OF930A0EE5.DA214D86-ONC1257A8B.00673BC9-C1257A8B.0067E92C@transmode.se>
 <OFD47DAD5E.85DB9677-ONC1257A8D.003FBACE-C1257A8D.004EC32A@rohde-schwarz.com>
 <OF422CEB2B.7CB3BECB-ONC1257A8D.0058F723-C1257A8D.00595592@transmode.se>
 <OF7B7B7723.82703A82-ONC1257A8D.005A1DFC-C1257A8D.005CA7D7@rohde-schwarz.com>
 <OFB615AF11.05DABF7D-ONC1257A8D.00661C69-C1257A8D.0066832C@transmode.se>
 <OF860E68DA.97A53995-ONC1257A8E.003297E0-C1257A8E.003308E2@rohde-schwarz.com>
Subject: Re: JFFS2 deadlock, kernel 3.4.11
To: Thomas.Betker@rohde-schwarz.com
Message-ID: <OF4EE2658D.D4054C9C-ONC1257A8E.0033523C-C1257A8E.003370D7@transmode.se>
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
Date: Fri, 5 Oct 2012 11:21:52 +0200
MIME-Version: 1.0
Content-type: text/plain; charset=US-ASCII
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Thomas.Betker@rohde-schwarz.com wrote on 2012/10/05 11:17:22:
>
> Hello Joakim:
>
> > I think your patch will work, but I don't like having 2 call sites
> > to grab_cache_page_write_begin(mapping, index, flags) so I came
> > up with this instead(untested as well):
>
> The tests I ran this night were successful. I have adapted my patch
> according to your suggestions and started re-testing; I won't be able to
> finish today, though, so I will post the final patch on Monday (assuming
> that it works).

I was just about to sent the final version. There was an bug in the
error patch. Hang in and a proper patch will come shortly.

 Jocke
