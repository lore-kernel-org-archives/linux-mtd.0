Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16nIUn-0003hB-00
	for <linux-mtd@lists.infradead.org>; Tue, 19 Mar 2002 12:13:41 +0000
Date: Tue, 19 Mar 2002 20:24:47 +0800 (MYT)
From: David Woodhouse <dwmw2@infradead.org>
To: Joakim Tjernlund <Joakim.Tjernlund@lumentis.se>
cc: linux-mtd@lists.infradead.org
Subject: Re: compr_zlib.c
In-Reply-To: <200203191203.NAA07400@mail.utfors.se>
Message-ID: <Pine.LNX.4.44.0203192022160.6019-100000@lapdancer.baythorne.internal>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

On Tue, 19 Mar 2002, Joakim Tjernlund wrote:

> No comments so far.
> Anyone?

Looks good. Suspect we should make it a new compression type instead, and 
fix the mount routine to check for compression types we don't support, 
like we check for node types we don't support.

-- 
dwmw2
