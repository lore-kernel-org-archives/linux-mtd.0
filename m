Date: Wed, 16 Feb 2005 15:28:37 +0000 (GMT)
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: Estelle HAMMACHE <estelle.hammache@st.com>
In-Reply-To: <42135E98.E187DD1A@st.com>
Message-ID: <Pine.LNX.4.58.0502161528260.30538@phoenix.infradead.org>
References: <20050216114741.GA16239@synertronixx3>
	<1108555269.24721.83.camel@tglx.tec.linutronix.de>
	<20050216122015.GB16239@synertronixx3>
	<1108556645.24721.86.camel@tglx.tec.linutronix.de>
	<20050216124409.GC16239@synertronixx3>
	<20050216133753.GD16239@synertronixx3> <42135E98.E187DD1A@st.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: Artem Bityuckiy <dedekind@infradead.org>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Oops vanilla 2.6.10
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Estelle HAMMACHE wrote:
> This would explain things... if you think it is plausible you could
> try commenting out the node merging in jffs2_mark_node_obsolete.
> 
I think Estelle is correct.
I would offer the following fix:

--- build.c     2005-02-16 18:21:41.253701801 +0300
+++ build.c-modified    2005-02-16 18:27:56.451612461 +0300
@@ -194,8 +194,10 @@
        D1(printk(KERN_DEBUG "JFFS2: Removing ino #%u with nlink == 
zero.\n", ic->ino));

        raw = ic->nodes;
-       while (raw != (void *)ic) {
+       while (raw && raw != (void *)ic) {
                struct jffs2_raw_node_ref *next = raw->next_in_ino;
+               while(next && ref_obsolete(next))
+                       next = next->next_in_ino;
                D1(printk(KERN_DEBUG "obsoleting node at 0x%08x\n", 
ref_offset(raw)));
                jffs2_mark_node_obsolete(c, raw);
                raw = next;

--
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
