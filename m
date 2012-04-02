Received: from [78.46.68.141] (helo=eristoteles.iwoars.net)
 by merlin.infradead.org with smtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SEihx-0002a0-Gj
 for linux-mtd@lists.infradead.org; Mon, 02 Apr 2012 14:58:13 +0000
Date: Mon, 2 Apr 2012 16:58:12 +0200 (CEST)
From: Joel Reardon <joel@clambassador.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [patch] UBIFS: Add cryptographic functionality when a key is
 passed to the compress / decompress functions
In-Reply-To: <1333378674.22146.18.camel@sauron.fi.intel.com>
Message-ID: <alpine.DEB.2.00.1204021655430.29393@eristoteles.iwoars.net>
References: <alpine.DEB.2.00.1202091615540.26924@eristoteles.iwoars.net>
 <alpine.DEB.2.00.1202202112220.21022@eristoteles.iwoars.net>
 <1330531826.3545.128.camel@sauron.fi.intel.com>
 <alpine.DEB.2.00.1203191635030.22256@eristoteles.iwoars.net>
 <1332511796.18717.72.camel@sauron.fi.intel.com>
 <alpine.DEB.2.00.1203231739330.22944@eristoteles.iwoars.net>
 <1332521515.22278.2.camel@sauron.fi.intel.com>
 <alpine.DEB.2.00.1203252302310.5527@eristoteles.iwoars.net>
 <alpine.DEB.2.00.1203252325100.5527@eristoteles.iwoars.net>
 <1332837188.31549.14.camel@sauron.fi.intel.com>
 <alpine.DEB.2.00.1203291639200.912@eristoteles.iwoars.net>
 <1333377383.22146.14.camel@sauron.fi.intel.com>
 <alpine.DEB.2.00.1204021645070.29393@eristoteles.iwoars.net>
 <1333378674.22146.18.camel@sauron.fi.intel.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: linux-fsdevel@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>
> I guess I was a little confused WRT iv vs cryptokey. Anyway, I thought
> you just use UBIFS_CRYPTO_KEYSIZE for all of this, why not to just use
> the constant in this function? Why passing the length as an argument?
>

There's no actually reason... in my head, if I have a char buffer then the
next parameter is its length. I'll change it so the comments discuss the
length of the buffer.
