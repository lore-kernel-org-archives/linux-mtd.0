Received: from mail-yb0-x22b.google.com ([2607:f8b0:4002:c09::22b])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eX9zk-0001VG-HP
 for linux-mtd@lists.infradead.org; Thu, 04 Jan 2018 18:12:02 +0000
Received: by mail-yb0-x22b.google.com with SMTP id b39so939117ybj.13
 for <linux-mtd@lists.infradead.org>; Thu, 04 Jan 2018 10:11:50 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAF4+tmpp_kYqFVgdz+HhVPR61m10k7ZyjNKBq6fRZw0eDVfYhA@mail.gmail.com>
References: <CAF4+tmpp_kYqFVgdz+HhVPR61m10k7ZyjNKBq6fRZw0eDVfYhA@mail.gmail.com>
From: Bogdan Harjoc <harjoc@gmail.com>
Date: Thu, 4 Jan 2018 20:11:48 +0200
Message-ID: <CAF4+tmo8C=YWb6p7KMjOG871ydZnxWR+ND7SqfOduBgXsd9HtQ@mail.gmail.com>
Subject: Re: Read errors after an UBIFS update
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> Would it help to try to test with the cherry picked 5-10 commits from
> linux 3.18.80 to 4.14 that touch fs/ubifs ?

I meant commits that touch fs/ubifs/tnc.c which was related to the
xattr fixes. I just realized there are hundreds of commits in fs/ubifs
since 2015. Sorry about that,

Bogdan
