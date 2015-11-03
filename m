Received: from mga11.intel.com ([192.55.52.93])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZtX1G-0002gw-Lo
 for linux-mtd@lists.infradead.org; Tue, 03 Nov 2015 08:32:44 +0000
Message-ID: <1446539539.6126.110.camel@gmail.com>
Subject: Re: master node can not be recovered
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Bean Huo =?UTF-8?Q?=E9=9C=8D=E6=96=8C=E6=96=8C?= "(beanhuo)"
 <beanhuo@micron.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>
Cc: Richard Weinberger <richard@nod.at>
Date: Tue, 03 Nov 2015 10:32:19 +0200
In-Reply-To: <A765B125120D1346A63912DDE6D8B6310BF4FB2A@NTXXIAMBX02.xacn.micron.com>
References: <A765B125120D1346A63912DDE6D8B6310BF4FB2A@NTXXIAMBX02.xacn.micron.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2015-11-02 at 16:10 +0000, Bean Huo 霍斌斌 (beanhuo) wrote:
> Hi, Richard 
> I tested my UBI power loss solution, have a question about master
> node.
> We all know that if master node be corrupted by power loss , we can
> recover it by second one. But from my testing results, in fact,
> It cannot be recovered by second backup master node. If first master
> node be corrupted by power loss, this relevant block will be
> correctly read, get_master_node will not reture 0, so next time
> recover operation will not run.
> Or I'm wrong?

There are debugging messages, can you please try to enable them and
share the resutl, so that we could see what was going on?
