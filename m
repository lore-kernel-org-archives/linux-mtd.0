From: David Woodhouse <dwmw2@infradead.org>
To: "Artem B. Bityuckiy" <abityuckiy@yandex.ru>
In-Reply-To: <41986A21.6040605@yandex.ru>
References: <41986A21.6040605@yandex.ru>
Content-Type: text/plain
Date: Mon, 15 Nov 2004 08:46:17 +0000
Message-Id: <1100508377.8015.59.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: one more field in raw_node_ref ?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2004-11-15 at 11:34 +0300, Artem B. Bityuckiy wrote:
> Hello guys,
> 
> I would be happy to know your opinions about to introduce one more 
> 32-bit field to the node_ref structure in the JFFS2. Is this really bad?

Yes but if you make a really good case for it and you finish the bits
which allow us to drop the length field we might let you get away with
it :)

-- 
dwmw2
