Received: from gw1.transmode.se ([195.58.98.146])
 by casper.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RqR4y-0002lL-1Z
 for linux-mtd@lists.infradead.org; Thu, 26 Jan 2012 15:17:36 +0000
In-Reply-To: <4F216902.3080004@flatfrog.com>
References: <4F1E802D.5010402@flatfrog.com> <4F1EE749.6020801@flatfrog.com>
 <4F1F004C.6040501@flatfrog.com> <4F205DBA.2090103@flatfrog.com>
 <4F206D8F.5010206@flatfrog.com> <4F21168F.4000800@flatfrog.com>
 <OF515AA54C.99F179CF-ONC1257991.0040C6F9-C1257991.0041489F@transmode.se>
 <4F214C52.5050300@flatfrog.com>
 <OFF7DA2700.9D726421-ONC1257991.004865DC-C1257991.0048F71D@transmode.se>
 <4F215E0B.107@flatfrog.com>
 <OF2516B1B0.B197779A-ONC1257991.004E8469-C1257991.004F0B1F@transmode.se>
 <4F216902.3080004@flatfrog.com>
Subject: Re: JFFS2 oops when writing to two partitions simultaneously
To: Orjan Friberg <of@flatfrog.com>
Message-ID: <OF5EAF49CD.F7F41C47-ONC1257991.0053C3D4-C1257991.005400C8@transmode.se>
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
Date: Thu, 26 Jan 2012 16:17:32 +0100
MIME-Version: 1.0
Content-type: text/plain; charset=US-ASCII
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Orjan Friberg <of@flatfrog.com> wrote on 2012/01/26 15:53:54:
>
> On 01/26/2012 03:23 PM, Joakim Tjernlund wrote:
> > I would stay away from JFFS2_COMPR_MODE_SIZE and JFFS2_COMPR_MODE_FAVOURLZO
> > all together as it looks broken in more than one way.
>
> CMODE_PRIORITY seems to work fine for me so I'll probably go with that.
>   Still, it would be nice if this was fixed or at least marked as broken
> (or removed if no-one is using it).  I don't think I can do the rewrite,
> but I'd be happy to try patches if someone else decides it's worth fixing.

You could try removing the lock dropping, one at a time, to see if it makes a difference.
That would be a data point for anyone wanting to fix this.

>
> Thanks for your help Joakim.

NP
      Jocke
