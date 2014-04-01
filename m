Received: from smtp45.i.mail.ru ([94.100.177.105])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WUv2N-0002bG-3c
 for linux-mtd@lists.infradead.org; Tue, 01 Apr 2014 09:31:20 +0000
Received: from [31.28.31.88] (port=53451 helo=[192.168.0.237])
 by smtp45.i.mail.ru with esmtpa (envelope-from <stsp@list.ru>)
 id 1WUv1y-00023V-Vq
 for linux-mtd@lists.infradead.org; Tue, 01 Apr 2014 13:30:55 +0400
Message-ID: <533A8749.4050802@list.ru>
Date: Tue, 01 Apr 2014 13:30:49 +0400
From: Stas Sergeev <stsp@list.ru>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: nandwrite and contiguous space
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello.

I am looking for a NAND flasher that supports searching
for the contiguous region of good blocks (within a specified
range), and flashes an image to it. It seems nandwrite - the
default linux flasher - can only skip bad blocks, but the scenario
I need, doesn't seem to be supported.
Is there any other flasher that does support this?
Or maybe some trick with nandwrite exists?
If not, how difficult is it to implement such a capability into
nandwrite?
