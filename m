Received: from mail-ig0-x231.google.com ([2607:f8b0:4001:c05::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZAFnv-0000f9-DI
 for linux-mtd@lists.infradead.org; Wed, 01 Jul 2015 11:03:47 +0000
Received: by igcsj18 with SMTP id sj18so131202780igc.1
 for <linux-mtd@lists.infradead.org>; Wed, 01 Jul 2015 04:03:26 -0700 (PDT)
MIME-Version: 1.0
Date: Wed, 1 Jul 2015 16:33:26 +0530
Message-ID: <CAMf7+LjVE7ivjwOCMdPYHCV8PG9yH7A=eVJ_WGiagxzvVc-_aw@mail.gmail.com>
Subject: Query on ubifs_assert
From: pavi1729 <pavitra1729@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

 FILE: fs/ubifs/misc.h :
 FUNCTION : ubifs_compr_present

"ubifs_compr_present" function has "ubifs_assert" which checks for the
valid compression value
and does a stack_dump if not.

Could there be a case where the "compr_type" is corrupt; if yes, then
does a stack_dump  suffice?
Thus if compr_type is invalid then the below return is not reliable.
    return !!ubifs_compressors[compr_type]->capi_name;

So where does this end, eventually does it go to a point where the
volume get corrupt and not unmountable ?

PS: If this is a very basic query do let me know, I can push this to
KernelNewbies mailing list.

Thanks,
PK
