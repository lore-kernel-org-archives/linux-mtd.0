Received: from out01.mta.xmission.com ([166.70.13.231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZPYTV-0004k0-OI
 for linux-mtd@lists.infradead.org; Wed, 12 Aug 2015 16:01:58 +0000
From: ebiederm@xmission.com (Eric W. Biederman)
To: Seth Forshee <seth.forshee@canonical.com>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, linux-mtd@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, linux-security-module@vger.kernel.org,
 selinux@tycho.nsa.gov, Serge Hallyn <serge.hallyn@canonical.com>,
 Andy Lutomirski <luto@amacapital.net>, linux-kernel@vger.kernel.org,
 John Johansen <john.johansen@canonical.com>,
 Kentaro Takeda <takedakn@nttdata.co.jp>,
 Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
 James Morris <james.l.morris@oracle.com>, Kees Cook <keescook@chromium.org>
References: <1439240719-46850-1-git-send-email-seth.forshee@canonical.com>
Date: Wed, 12 Aug 2015 10:54:44 -0500
In-Reply-To: <1439240719-46850-1-git-send-email-seth.forshee@canonical.com>
 (Seth Forshee's message of "Mon, 10 Aug 2015 16:05:11 -0500")
Message-ID: <87oaica4e3.fsf@x220.int.ebiederm.org>
MIME-Version: 1.0
Content-Type: text/plain
Subject: Re: [PATCH v2 0/7] Initial support for user namespace owned mounts
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Seth Forshee <seth.forshee@canonical.com> writes:

> This series adds support for the idea of superblocks owned by
> unprivileged user namespaces. This is initially used to simplify the
> MNT_NODEV handling for unpivileged mounts, and the ultimate goal is to
> allow mounting of additional filesystem types from unprivileged
> containers. As such these are the first in a larger set of patches, with
> the full series (so far) available at:
>
>   git://kernel.ubuntu.com/sforshee/linux.git userns-mounts

Seth just a quick note to let you know this isn't forgotten.  I have a
big pile of things to work through this week, so probably the first
chance I will have to look at your updated patches is during the boring
bits of Linux Plumbers Conf.

Eric
