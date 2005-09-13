Received: from eos.fwall.u-szeged.hu ([160.114.120.248])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EF9Rr-0006CA-JG
	for linux-mtd@lists.infradead.org; Tue, 13 Sep 2005 08:00:21 -0400
Message-ID: <4326BF19.40806@inf.u-szeged.hu>
Date: Tue, 13 Sep 2005 13:59:21 +0200
From: Ferenc Havasi <havasi@inf.u-szeged.hu>
MIME-Version: 1.0
To: zhao forrest <zhao_fusheng@hotmail.com>
References: <BAY17-F5764D8A5D6C706B910F94E89C0@phx.gbl>
In-Reply-To: <BAY17-F5764D8A5D6C706B910F94E89C0@phx.gbl>
Content-Type: text/plain; charset=ISO-8859-2; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Should we put jffs2_sum_marker into eraseblock_header?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

zhao forrest wrote:
> When writing the eraseblock_header patch, I found the current
> summary patch in MTD CVS place jffs2_sum_marker at the end of
> each erase block. Since jffs2_sum_marker is a per-eraseblock
> structure, should we put it into eraseblock_header when the
> eraseblock_header patch is ready in the future?

The information which is stored in the sum_marker is avaiable only at 
the time when the the erase block is under closing. (it is the time when 
we store the summary infromation and we know its size)

If the eraseblock_header can be changed at that time than OK, otherwise 
it is not helpfull for summary purposes.

Ferenc
