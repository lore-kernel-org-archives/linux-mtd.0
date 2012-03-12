Received: from [78.46.68.141] (helo=eristoteles.iwoars.net)
 by merlin.infradead.org with smtp (Exim 4.76 #1 (Red Hat Linux))
 id 1S7C3Z-0003VG-7i
 for linux-mtd@lists.infradead.org; Mon, 12 Mar 2012 20:41:26 +0000
Date: Mon, 12 Mar 2012 14:34:41 +0100 (CET)
From: Joel Reardon <joel@clambassador.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [patch] Adding Secure Deletion to UBIFS
In-Reply-To: <1331559053.12037.25.camel@sauron.fi.intel.com>
Message-ID: <alpine.DEB.2.00.1203121430020.29192@eristoteles.iwoars.net>
References: <alpine.DEB.2.00.1202091615540.26924@eristoteles.iwoars.net>
 <1330536308.3545.158.camel@sauron.fi.intel.com>
 <alpine.DEB.2.00.1203011434220.2462@eristoteles.iwoars.net>
 <1331278562.22872.18.camel@sauron.fi.intel.com>
 <alpine.DEB.2.00.1203091959570.25737@eristoteles.iwoars.net>
 <1331559053.12037.25.camel@sauron.fi.intel.com>
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
> I think you can use them. But is it possible to kill these things from
> the data nodes themselves? We can always find it by looking up the index
> by the data node key, right?
>

Yep, thats exactly right. Originally it was just inside the data node;
I put it into the TNC as a optimization later during development. If I use
the last eight bytes from the data node's key, and I remove the position
from ubifs_branch, then there is no longer any change to the on-disk
format, so thats should be useful. Yeah, storing the same value twice
means also needing a consistency check. What can be done is that when the
value is loaded once after mounting, it is stored in in the z-node in
memory.
