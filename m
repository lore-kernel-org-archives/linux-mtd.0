Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17pbVj-0006yR-00
	for <linux-mtd@lists.infradead.org>; Thu, 12 Sep 2002 22:28:27 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <2702075D4DE2B043BF5EB82E9CFAD45B0BD3B2@mail1.mediatrix.com> 
References: <2702075D4DE2B043BF5EB82E9CFAD45B0BD3B2@mail1.mediatrix.com> 
To: Frederic Giasson <fgiasson@mediatrix.com>
Cc: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Subject: Re: jffs2_scan_eraseblock() errors - truly harmless? 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 12 Sep 2002 22:28:25 +0100
Message-ID: <23182.1031866105@redhat.com>
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

fgiasson@mediatrix.com said:
> But since the error message does apparently not disappear easily, what
> about the space used by the node with the bad CRC?  I looked at the
> code and at mount time it is added to the dirty space, but it is not
> marked as obsolete on the medium...  thus the gc will not collect it.

The GC _will_ collect it. Marking stuff obsolete on the medium is just an 
optimisation to speed up the scan, what's important is whether we consider 
it obsolete in our in-memory records. Which we do -- when we happen to GC 
the block containing the node in question.

>  You also mentionned than in old JFFS2 code those nodes with bad CRC
> are marked as obsolete when discovered at mount time, but where is
> this happening?  I loooked at old code ( as per 2.4.19-pre7 ) and the
> jffs2_scan_eraseblock() function does not seem to obsolete the nodes
> obsolete itself. Where is this obsoleting done? 

Er, I can't see it. I could have sworn that we used to mark the offending
nodes obsolete on the medium when we saw the CRC fail, so we didn't check
the same CRC again and hence didn't whinge about it again. Then when the
accounting changed with the rotate_lists stuff I stopped it doing that
briefly, then changed it back again when I realised it was complaining about
the CRCs repeatedly. Maybe ask me again in the morning :)

> I am using CVS code as per July 3rd.  I know that more recent code
> should not complain with such messages at mount time, but unless
> absolutely necessary I'd rather not upgrade right now.  If I am right
> when I say that the GC will not collect the bad CRC node, how could I
> patch the code (without side effects!) to obsolete the bad crc nodes? 

It will GC them when it gets round to it. Leave it.

--
dwmw2
