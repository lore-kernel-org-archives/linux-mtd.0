Received: from mail-pa0-x232.google.com ([2607:f8b0:400e:c03::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Ymf9P-00068O-DG
 for linux-mtd@lists.infradead.org; Mon, 27 Apr 2015 09:16:27 +0000
Received: by pacyx8 with SMTP id yx8so122984455pac.1
 for <linux-mtd@lists.infradead.org>; Mon, 27 Apr 2015 02:16:06 -0700 (PDT)
MIME-Version: 1.0
Sender: vapier@google.com
In-Reply-To: <1429035518-8323-1-git-send-email-namnguyen@chromium.org>
References: <1429035518-8323-1-git-send-email-namnguyen@chromium.org>
From: Mike Frysinger <vapier@chromium.org>
Date: Mon, 27 Apr 2015 17:15:45 +0800
Message-ID: <CAAbOScnTQuujGN7AkiieL+KciF0RNaQyvga+hDB4H6VwY1=RjA@mail.gmail.com>
Subject: Re: [PATCH v4] mtd-utils: Add mtdpart to add/delete partition
To: Nam Nguyen <namnguyen@chromium.org>
Content-Type: text/plain; charset=UTF-8
Cc: linux-mtd@lists.infradead.org, dehrenberg@chromium.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Apr 15, 2015 at 2:18 AM, <namnguyen@chromium.org> wrote:
> +static int                     part_no;                /* partition number */

it's an int ...

> +       if (strcmp(s_command, "del") == 0 && (argc - optind) == 1) {
> +               const char *s_part_no = argv[optind++];
> +
> +               part_no = simple_strtol(s_part_no, &error);

... but here you use simple_strol.  so there's a possibility of silent
truncation ?  i'd change part_no to a long and then check to see if it
exceeds INT_MAX.
-mike
