Received: from c135.h203149222.is.net.tw
	([203.149.222.135] helo=ms.gv.com.tw ident=root)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 181QS7-00078v-00
	for <linux-mtd@lists.infradead.org>; Tue, 15 Oct 2002 13:05:35 +0100
Message-ID: <00bf01c27443$37238220$b30210ac@gv.com.tw>
From: "??" <kevin@gv.com.tw>
To: "David Woodhouse" <dwmw2@infradead.org>
Cc: "Linux MTD mailing list" <linux-mtd@lists.infradead.org>
References: <000e01c27400$f0766c30$80d1a8c0@synso.com.tw>  <32372.1034663283@passion.cambridge.redhat.com>
Subject: [power-saving issue]
Date: Tue, 15 Oct 2002 20:05:55 +0800
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
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

dear all,

we want to stop gc thread manually when system goto suspend mode,

can we simply call "jffs2_stop_garbage_collect_thread()"?
and how to get its param: "struct jffs2_sb_info *c"

btw, i think gc thread wakeup only if its necessary not regularly, right?

best regards,
