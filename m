Received: from outbound.mailhop.org ([63.208.196.171])
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1FdmZ3-00054a-UO
	for linux-mtd@lists.infradead.org; Wed, 10 May 2006 07:09:36 -0400
Received: from [84.216.44.95] (helo=arbetsmyra.dyndns.org)
	by outbound.mailhop.org with esmtpa (Exim 4.51) id 1FdmYy-000FYh-Kr
	for linux-mtd@lists.infradead.org; Wed, 10 May 2006 07:09:05 -0400
Received: from there (sol-int [10.0.2.1])
	by arbetsmyra.dyndns.org (Postfix) with SMTP id A49A187E
	for <linux-mtd@lists.infradead.org>;
	Wed, 10 May 2006 13:09:01 +0200 (CEST)
Content-Type: text/plain;
  charset="iso-8859-1"
From: Ronny L Nilsson <rln-mtd@arbetsmyra.dyndns.org>
To: linux-mtd@lists.infradead.org
Date: Wed, 10 May 2006 13:07:40 +0200
References: <20060502214507.C56443DC@arbetsmyra.dyndns.org>
In-Reply-To: <20060502214507.C56443DC@arbetsmyra.dyndns.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <20060510110901.A49A187E@arbetsmyra.dyndns.org>
Subject: Re: Patch for passing JFFS2 options at mount time
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


> Attached is a patch for passing mount options to JFFS2. I was in the
> need for controlling the compression mode for JFFS2 filesystems on a
> per mount basis but found that up till now a recompile of the kernel
> was the only way to change the active mode in use (?). With this
> patch different filesystems can use different compressor modes,
> configurable at mount time. They can change mode on the fly via a
> remount too.


Hi
I got no feedback what so ever to my patch. Was it really that 
uninteresting?

/Ronny
