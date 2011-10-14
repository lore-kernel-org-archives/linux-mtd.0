Received: from [85.183.114.52] (helo=Dublin.logfs.org)
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1REjW0-0006xV-RF
	for linux-mtd@lists.infradead.org; Fri, 14 Oct 2011 15:17:41 +0000
Date: Fri, 14 Oct 2011 17:18:34 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: "Fache, Herve" <h-fache@ti.com>
Subject: Re: Make phram work with kernel cmdline args when built-in
Message-ID: <20111014151834.GB32633@logfs.org>
References: <CA+Xn3W3-JCqMKjiXi2cLCGm_bHtRx8RPsc9P5BoOS6YmbGZmHw@mail.gmail.com>
	<20111012164837.GA13691@logfs.org>
	<CA+Xn3W18bwZWzdjmRzEDUCqe3bVHnmW-7bJ_wvaoXpJxO1KmjQ@mail.gmail.com>
	<1318597412.12351.124.camel@sauron>
	<CA+Xn3W2P_+xdwwrvcBKREZmsj2O6=GOfyaywW-N2HhGwo0WzVg@mail.gmail.com>
	<20111014143816.GA32633@logfs.org>
	<CA+Xn3W0dDEYMm7TZiB-0R41Qtb1C7EaBJM9px==kWzaepMnz2g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+Xn3W0dDEYMm7TZiB-0R41Qtb1C7EaBJM9px==kWzaepMnz2g@mail.gmail.com>
Cc: linux-mtd@lists.infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 14 October 2011 16:48:45 +0200, Fache, Herve wrote:
> 
> Looks like it's just a matter of properly using 'phram_init_called'.
> Shall I submit a new version of the patch that does that?

Since my brain cannot quite translate that into code yet: yes please.

Jörn

-- 
Unless something dramatically changes, by 2015 we'll be largely
wondering what all the fuss surrounding Linux was really about.
-- Rob Enderle
