From: David Woodhouse <dwmw2@infradead.org>
To: "Artem B. Bityuckiy" <dedekind@yandex.ru>
In-Reply-To: <419DBAA4.4070207@yandex.ru>
References: <Pine.LNX.4.44.0411181209170.27784-100000@localhost.localdomain>
	<1100810691.31062.22.camel@weaponx.rchland.ibm.com>
	<419DBAA4.4070207@yandex.ru>
Content-Type: text/plain
Message-Id: <1100856673.21273.318.camel@baythorne.infradead.org>
Mime-Version: 1.0
Date: Fri, 19 Nov 2004 09:31:14 +0000
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Determining actual flash usage of a particular file
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2004-11-19 at 12:19 +0300, Artem B. Bityuckiy wrote:
> You may write some fctl which does this. In the kernel space, it is very 
> easy to calculate th actual size of the file on flash (just go through 
> node_refs and summ the ref->totlen).

...of the non-obsolete nodes.

-- 
dwmw2
