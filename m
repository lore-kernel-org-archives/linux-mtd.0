Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gYg13-0001Kj-N3
 for linux-mtd@lists.infradead.org; Sun, 16 Dec 2018 23:40:11 +0000
Received: by mail-wm1-x343.google.com with SMTP id a18so10888976wmj.1
 for <linux-mtd@lists.infradead.org>; Sun, 16 Dec 2018 15:39:58 -0800 (PST)
MIME-Version: 1.0
References: <cover.1524823321.git.h.grohne@intenta.de>
 <d36fa783db66ec430565a065245ebcacfea39e13.1524823321.git.h.grohne@intenta.de>
 <1524833695.18504.36.camel@infradead.org>
 <20180430103126.w44pr4u3pyjbatbp@laureti-dev>
In-Reply-To: <20180430103126.w44pr4u3pyjbatbp@laureti-dev>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Mon, 17 Dec 2018 00:39:44 +0100
Message-ID: <CAFLxGvzSkho10AETRJKNMZgYqSwNpxVg3kuKNOLUifLDVjUCeg@mail.gmail.com>
Subject: Re: [PATCH v2] jffs2: put directories f->sem on a separate lockdep
 class
To: h.grohne@intenta.de
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 Peter Zijlstra <peterz@infradead.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Apr 30, 2018 at 12:32 PM Helmut Grohne <h.grohne@intenta.de> wrote:
> +       /* Mirror lock class of inode->i_rwsem, see
> +        * lockdep_annotate_inode_mutex_key.
> +        */
> +       lockdep_set_class(&f->sem, S_ISDIR(inode->i_mode) ?
> +               &jffs2_inode_info_sem_dir_key : &jffs2_inode_info_sem_key);

Please use a plain if/else branch.
lockdep_set_class() uses the second parameter verbatim in its reports.

-- 
Thanks,
//richard
