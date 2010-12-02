Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PO88C-0000dt-RO
	for linux-mtd@lists.infradead.org; Thu, 02 Dec 2010 12:19:25 +0000
Received: by bwz5 with SMTP id 5so7441909bwz.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 02 Dec 2010 04:19:20 -0800 (PST)
Subject: Re: UBIFS partition on NOR flash not mountable after power cut test
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Anatolij Gustschin <agust@denx.de>
In-Reply-To: <20101202105729.04c25fc1@wker>
References: <20101129195014.19224240@wker> <20101201130534.5b95ce83@wker>
	<20101201164447.2215bc58@wker> <1291264926.14534.32.camel@koala>
	<20101202105729.04c25fc1@wker>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 02 Dec 2010 14:18:45 +0200
Message-ID: <1291292325.2526.23.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, Detlev Zundel <dzu@denx.de>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2010-12-02 at 10:57 +0100, Anatolij Gustschin wrote:
> UBIFS DBG (pid 1290): no_more_nodes: unexpected bad common header at 37:157472
> UBIFS error (pid 1290): ubifs_recover_leb: bad node
> UBIFS error (pid 1290): ubifs_scanned_corruption: corruption at LEB 37:157472
> UBIFS error (pid 1290): ubifs_scanned_corruption: first 8192 bytes from LEB 37:157472
> 00000000: 31181006 270758c8 0c331500 00000000 ffffffff ffffffff ff4fffff f3428020  1...'.X..3...............O...B. 

But this looks exactly like you have 64-bit write-buffer, but UBIFS
c->min_io_unit is not 64, but it should be 64. Or you need a NOR hack to
force 8-bytes write-buffer.

Are you sure you did not miss your NOR write-buffer hacks?

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
