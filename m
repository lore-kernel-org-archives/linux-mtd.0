From: David Woodhouse <dwmw2@infradead.org>
To: Richard_Theil@dadebehring.com
In-Reply-To: <OF00A6CB1C.1181C429-ONC1256E67.003B93D3-C1256E67.003BCC89@dadebehring.com>
References: 
	<OF00A6CB1C.1181C429-ONC1256E67.003B93D3-C1256E67.003BCC89@dadebehring.com>
Content-Type: text/plain
Message-Id: <1080651809.24117.167.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Tue, 30 Mar 2004 14:03:29 +0100
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS2 not honouring MS_RDONLY flag on mount?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2004-03-30 at 12:55 +0200, Richard_Theil@dadebehring.com wrote:
> It seems that somewhere on the path into jffs2_get_sb_mtd(), the flags 
> passed as parameter _should_ be honoured, but are not. This would have to happen
> before jffs2_do_fill_super is called, because in there, the collector 
> thread is started if the fs is flagged r/w.

I've committed a patch which adds the slightly simpler alternative
'sb->s_flags = flags' in the place you suggested. Thanks.

> (*) Well, I had to find out the "rootfstype" thing the hard way...

Yeah -- I meant to do something about that, and make it so you could
mount by partition name as root, like you can later. It didn't make 2.6
though.

-- 
dwmw2
