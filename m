Received: from mail-out.m-online.net ([212.18.0.10])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NaERK-0004HI-K8
	for linux-mtd@lists.infradead.org; Wed, 27 Jan 2010 20:24:43 +0000
To: Grant Likely <grant.likely@secretlab.ca>
From: Wolfgang Denk <wd@denx.de>
Subject: Re: [PATCH 3/8 v2] mtd: Add MPC5121 NAND Flash Controller driver
MIME-Version: 1.0
Content-type: text/plain; charset=ISO-8859-1
Content-transfer-encoding: 8bit
In-reply-to: <fa686aa41001270843u3b4e9687k699ad579de4460d4@mail.gmail.com>
References: <1264594052-20317-1-git-send-email-agust@denx.de>
	<1264594052-20317-4-git-send-email-agust@denx.de>
	<fa686aa41001270843u3b4e9687k699ad579de4460d4@mail.gmail.com>
Date: Wed, 27 Jan 2010 21:24:27 +0100
Message-Id: <20100127202427.D311CD334C9@gemini.denx.de>
Cc: John Rigby <jcrigby@gmail.com>, Piotr Ziecik <kosmo@semihalf.com>,
	dzu@denx.de, linuxppc-dev@ozlabs.org, linux-mtd@lists.infradead.org,
	Anatolij Gustschin <agust@denx.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear Grant Likely,

In message <fa686aa41001270843u3b4e9687k699ad579de4460d4@mail.gmail.com> you wrote:
>
> > +       if (rev != 2) {
> > +               dev_err(dev, "SoC revision %u is not supported!\n", rev);
> > +               return -ENXIO;
> > +       }
>
> *Only* revision 2?  Are future revisions of silicon assumed to be broken then?

I vote for keeping it this way - if you look at the diffferences
between revision 1 and 2, or at differences between MPC5121/3 and
MPC5125, it is more than likely that revision 3, should it ever come
out, will be incompatible and require driver changes.

Best regards,

Wolfgang Denk

-- 
DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-10 Fax: (+49)-8142-66989-80 Email: wd@denx.de
Landru! Guide us!
	-- A Beta 3-oid, "The Return of the Archons", stardate 3157.4
