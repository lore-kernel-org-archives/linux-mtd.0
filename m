From: David Woodhouse <dwmw2@infradead.org>
To: "Artem B. Bityuckiy" <dedekind@infradead.org>
In-Reply-To: <Pine.LNX.4.58.0501191302470.8174@phoenix.infradead.org>
References: <MKELJOLMMOHJCMIPKLJKAEBJCBAA.j.karrer@lightmaze.com>
	<Pine.LNX.4.58.0501191302470.8174@phoenix.infradead.org>
Content-Type: text/plain
Date: Wed, 19 Jan 2005 13:38:41 +0000
Message-Id: <1106141921.26551.516.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Jochen Karrer <j.karrer@lightmaze.com>, linux-mtd@lists.infradead.org
Subject: Re: mysqld on jffs2: MyISAM Index write is slow
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2005-01-19 at 13:03 +0000, Artem B. Bityuckiy wrote:
> Not expert in this issue, but I was told by David that JFFS2 is 
> synchronous, and you need redesigning it if you want asynchronous 
> behaviour.

It's often been suggested that the best way to do databice on JFFS2
would just to be to start supporting extended attributes, then design a
database which uses those for its storage. 

-- 
dwmw2
