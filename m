Received: from gw1.transmode.se ([213.115.205.20])
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1ON36S-00029P-Ah
	for linux-mtd@lists.infradead.org; Fri, 11 Jun 2010 12:12:53 +0000
In-Reply-To: <OF6FD3E8A2.2EDC41D1-ONC125773F.0039DD3B-C125773F.003AFE83@transmode.se>
References: <1276248975-1822-1-git-send-email-stanley.miao@windriver.com>	<1276248975-1822-2-git-send-email-stanley.miao@windriver.com>
	<1276248975-1822-3-git-send-email-stanley.miao@windriver.com>	<OFDBEF7A42.BA0205E8-ONC125773F.0034F62C-C125773F.00358229@LocalDomain>
	<OF17604B8E.95B0C75E-ONC125773F.00361B51-C125773F.00365BD5@transmode.se>	<4C121198.5030807@windriver.com>
	<OF6FD3E8A2.2EDC41D1-ONC125773F.0039DD3B-C125773F.003AFE83@transmode.se>
Subject: Re: [PATCH 2/3] Discard the legacy interface
	MEMGETOOBSEL	in	flash_eraseall
Message-ID: <OFD47C0229.927FA4AC-ONC125773F.0042C2E4-C125773F.0042F9D3@transmode.se>
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
Date: Fri, 11 Jun 2010 14:11:33 +0200
MIME-Version: 1.0
Content-type: text/plain; charset=US-ASCII
Cc: Artem.Bityutskiy@nokia.com, linux-mtd@lists.infradead.org,
	"stanley.miao" <stanley.miao@windriver.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> "stanley.miao" <stanley.miao@windriver.com> wrote on 2010/06/11 12:36:08:
> >
> > Joakim Tjernlund wrote:
> > > Joakim Tjernlund/Transmode wrote on 2010/06/11 11:44:27:

> >
> > >
> > > Forgot, use uname(2) instead of /proc/version
> > >
> >
> > Why ?
>
> Cleaner, faster, shorter, more portable, less likely to fail.

Here is a quick example of uname(2):

#include <stdio.h>
#include <sys/utsname.h>

int main()
{
	int a, b, c , ret;
	struct utsname buf;

	ret = uname (&buf);
	if (ret < 0)
		return -1;
	ret = sscanf(buf.release, "%d.%d.%d", &a, &b, &c);
	if (ret != 3)
		return -1;
	printf("a:%d, b:%d, c:%d, ret:%d\n", a, b, c, ret);
	return 0;
}
