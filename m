Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZtIFa-0005t3-JV
 for linux-mtd@lists.infradead.org; Mon, 02 Nov 2015 16:46:31 +0000
Subject: Re: master node can not be recovered
To: =?UTF-8?B?QmVhbiBIdW8g6ZyN5paM5paMIChiZWFuaHVvKQ==?= <beanhuo@micron.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
References: <A765B125120D1346A63912DDE6D8B6310BF4FB2A@NTXXIAMBX02.xacn.micron.com>
From: Richard Weinberger <richard@nod.at>
Message-ID: <5637934D.5000503@nod.at>
Date: Mon, 2 Nov 2015 17:46:05 +0100
MIME-Version: 1.0
In-Reply-To: <A765B125120D1346A63912DDE6D8B6310BF4FB2A@NTXXIAMBX02.xacn.micron.com>
Content-Type: text/plain; charset=gbk
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Bean,

Am 02.11.2015 um 17:10 schrieb Bean Huo »ô±ó±ó (beanhuo):
> Hi, Richard 
> I tested my UBI power loss solution, have a question about master node.
> We all know that if master node be corrupted by power loss , we can recover it by second one. But from my testing results, in fact,
> It cannot be recovered by second backup master node. If first master node be corrupted by power loss, this relevant block will be correctly read, get_master_node will not reture 0, so next time recover operation will not run.
> Or I'm wrong?

ubifs_recover_master_node() is very strict.
Can it be that in your case more than the last written page is corrupted?

Thanks,
//richard
