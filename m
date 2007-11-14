Subject: Re: [RFC] BUG Power loss recovery issues in JFFS2
From: David Woodhouse <dwmw2@infradead.org>
To: Alexey Korolev <akorolev@infradead.org>
In-Reply-To: <Pine.LNX.4.64.0711141825330.19494@pentafluge.infradead.org>
References: <Pine.LNX.4.64.0711141825330.19494@pentafluge.infradead.org>
Content-Type: text/plain
Date: Wed, 14 Nov 2007 15:17:36 -0500
Message-Id: <1195071456.2533.45.camel@shinybook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Roman.borisov@intel.com, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2007-11-14 at 18:33 +0000, Alexey Korolev wrote:
> If we try to read the content of this file we won.t get any data but receive read error:
> Data CRC 949a52c7 != calculated CRC 0c434291 for node at 00380084
> 
> The issue is related to existing implementation of
> jffs2_scan_eraseblock() function which skips the content scanning of
> nodes to reach acceptable mount performance. 

That shouldn't happen. When one node obsoletes an earlier node covering
the same range, we _should_ be checking the data CRC. I reimplemented
this part of the code only recently.

Please could you show me a file system image which exhibits this
problem? I'm unconvinced by your diagnosis.

-- 
dwmw2
