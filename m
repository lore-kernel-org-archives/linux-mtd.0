Received: from [78.46.68.141] (helo=eristoteles.iwoars.net)
 by merlin.infradead.org with smtp (Exim 4.76 #1 (Red Hat Linux))
 id 1S8XIh-0004R8-HW
 for linux-mtd@lists.infradead.org; Fri, 16 Mar 2012 13:34:36 +0000
Date: Fri, 16 Mar 2012 14:34:31 +0100 (CET)
From: Joel Reardon <joel@clambassador.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [patch] Remove notion of key schemes
In-Reply-To: <1331902271.3730.76.camel@sauron.fi.intel.com>
Message-ID: <alpine.DEB.2.00.1203161405090.2249@eristoteles.iwoars.net>
References: <alpine.DEB.2.00.1202091615540.26924@eristoteles.iwoars.net>
 <1329152067.22240.214.camel@sauron.fi.intel.com>
 <alpine.DEB.2.00.1202231558400.13720@eristoteles.iwoars.net>
 <alpine.DEB.2.00.1203151545410.26775@eristoteles.iwoars.net>
 <1331902271.3730.76.camel@sauron.fi.intel.com>
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


On Fri, 16 Mar 2012, Artem Bityutskiy wrote:

> On Thu, 2012-03-15 at 15:48 +0100, Joel Reardon wrote:
> > +       __u8 padding0[8]; /* Watch 'zero_dent_node_unused()' if changing! */
>
> Also please, be consistent with overall UBIFS coding style and comment
> fields at the structure header comment, not near the field itself.
>


I actually just copied this comment from the comment following padding1
and padding2; should they all just be omitted?


As for the ubifs being mounted with the old, it may be best to increase
the version format number. The old version won't be able to 'read' (i.e.,
decrypt) the data, while the new version has a switch to enable both
modes. If new data is written by the old version then the new version will
also have trouble to read it (unless we set crypto_lookup==0 to mean no
key). But its probably for the best to just let older version mount the
security enhanced one as read-only using the version format as the data
will be anyhow unreadable. Non-security-enhanced ubifs (but
aware) partitions can set the version format to the older value as they
will be compatible.

cheers,
Joel Reardon
