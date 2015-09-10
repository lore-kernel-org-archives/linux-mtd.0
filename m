Received: from mail-io0-x242.google.com ([2607:f8b0:4001:c06::242])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Za3QS-0006PE-8O
 for linux-mtd@lists.infradead.org; Thu, 10 Sep 2015 15:06:12 +0000
Received: by iofb144 with SMTP id b144so6072943iof.1
 for <linux-mtd@lists.infradead.org>; Thu, 10 Sep 2015 08:05:55 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <A765B125120D1346A63912DDE6D8B6310BF4B022@NTXXIAMBX02.xacn.micron.com>
References: <A765B125120D1346A63912DDE6D8B6310BF4B022@NTXXIAMBX02.xacn.micron.com>
Date: Thu, 10 Sep 2015 12:05:54 -0300
Message-ID: <CAOMZO5AZgCd2WMkwfpd3Ec4JWAOJS6P+iE_yCwSa5AR9RixZnw@mail.gmail.com>
Subject: Re: How to know mainline linux verion of certain patch being merged
 into
From: Fabio Estevam <festevam@gmail.com>
To: =?UTF-8?B?QmVhbiBIdW8g6ZyN5paM5paMIChiZWFuaHVvKQ==?= <beanhuo@micron.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Sep 10, 2015 at 10:58 AM, Bean Huo =E9=9C=8D=E6=96=8C=E6=96=8C (bea=
nhuo)
<beanhuo@micron.com> wrote:
> Hi, all
> If I know the time of one patch being merged in Linux, and how I can know=
 relevant Linux version?
> Means that I want to know from which Linux kernel version that this patch=
 being enabled.
> Thanks for Any helpful information in advance.

You can use:

git tag --contains <commitid>

Regards,

Fabio Estevam
