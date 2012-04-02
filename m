Received: from [78.46.68.141] (helo=eristoteles.iwoars.net)
 by merlin.infradead.org with smtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SEiYn-0001uG-3y
 for linux-mtd@lists.infradead.org; Mon, 02 Apr 2012 14:48:45 +0000
Date: Mon, 2 Apr 2012 16:48:42 +0200 (CEST)
From: Joel Reardon <joel@clambassador.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [patch] UBIFS: Add cryptographic functionality when a key is
 passed to the compress / decompress functions
In-Reply-To: <1333377383.22146.14.camel@sauron.fi.intel.com>
Message-ID: <alpine.DEB.2.00.1204021645070.29393@eristoteles.iwoars.net>
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
> You support only one length - please, kill ivlen parameter.
>
> Also, should ubifs_aes_crypt be static? I do not see any users outside
> of compress.c. In this case remove the "ubifs_" prefix. But a
> non-written convention, in UBIFS we _tend_ to prefix only non-static
> functions with "ubifs_" and avoid having it for static functions.
>

Should length for key remain, and the IV is just the same? Or should the
global #define just be used inside the aes function.

There is another use where the data is decrypted and reencrypted with a
different key. (during GC and if an erase block becomes bad.) In this
case, the data is not decompressed and recompressed, only the encryption
changes. However, for simplicity, and because its not frequent, we can
make it static and use the compress functions to handle this.

>
> I guess the above goto is redundant?
>

It is, but I put it in for future developers who may add a new control
case there after without expecting the above to 'fall through'.
