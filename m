Received: from py-out-1112.google.com ([64.233.166.181])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GY9Wu-0001ud-SF
	for linux-mtd@lists.infradead.org; Thu, 12 Oct 2006 19:00:01 -0400
Received: by py-out-1112.google.com with SMTP id c31so850146pyd
	for <linux-mtd@lists.infradead.org>;
	Thu, 12 Oct 2006 15:59:54 -0700 (PDT)
Message-ID: <6934efce0610121559o3f38754bmc0a768fd71041378@mail.gmail.com>
Date: Thu, 12 Oct 2006 15:59:54 -0700
From: "Jared Hulbert" <jaredeh@gmail.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Couple ideas for custom jffs2 build
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

We are attempting to reduce RAM consumption of jffs2 for a specific
customer with a specific use case in mind.  One idea is to hack it to
merge jffs2_full_dnode and jffs3_node_frag.  From a high level I can
see this would make every write a full dnode replace.  But for
multimedia file storage this is not so bad.  I'm assume this _could_
be done without _too_ much effort, it feels naive to me though.  How
bad is this?

The second issue is a 20s delay in open()ing a 30MB file.  We believe,
having looked at /proc/slabinfo, this is caused by  the system having
to read in all the jffs2_node_frags.  Wouldn't it be _easy_ to put a
blocks raw jffs2_node_frags in the eraseblock summary and sort through
them at boot?
