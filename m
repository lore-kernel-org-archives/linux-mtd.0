From: David Woodhouse <dwmw2@infradead.org>
To: "Artem B. Bityuckiy" <abityuckiy@yandex.ru>
In-Reply-To: <41615BA7.60801@yandex.ru>
References: <416122A1.4060302@oktetlabs.ru>
	<1096885344.30942.559.camel@hades.cambridge.redhat.com>
	<416127B7.3070505@yandex.ru>
	<1096893242.22034.5.camel@weaponx.rchland.ibm.com>
	<41614B2F.8060901@yandex.ru>
	<1096895892.30942.614.camel@hades.cambridge.redhat.com>
	<41615BA7.60801@yandex.ru>
Content-Type: text/plain
Message-Id: <1096899817.30942.618.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Mon, 04 Oct 2004 15:23:37 +0100
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: inode checkpoints
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2004-10-04 at 18:18 +0400, Artem B. Bityuckiy wrote:
>      jint32_t data_crc;  /* the CRC checksum of the checkpoint data */
>      jint32_t node_crc;  /* the CRC checksum of the checkpoint object without data */

You probably don't need to separate these. You'll only ever want to read
the _whole_ thing anyway, surely?

Other than that it looks sane enough at first glance. It looks like it
_will_ be useful enough for NOR flash too. I'd rather not have two
implementations if this is good enough for both.

-- 
dwmw2
