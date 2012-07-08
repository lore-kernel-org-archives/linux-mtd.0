Received: from mail4-relais-sop.national.inria.fr ([192.134.164.105])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SnrOy-00044h-Ei
 for linux-mtd@lists.infradead.org; Sun, 08 Jul 2012 13:19:53 +0000
From: Julia Lawall <Julia.Lawall@lip6.fr>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH] remove invalid reference to list iterator variable
Date: Sun,  8 Jul 2012 15:19:41 +0200
Message-Id: <1341753582-3943-1-git-send-email-Julia.Lawall@lip6.fr>
Cc: linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org,
 Adrian Hunter <adrian.hunter@intel.com>, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

If list_for_each_entry, etc complete a traversal of the list, the iterator
variable ends up pointing to an address at an offset from the list head,
and not a meaningful structure.  Thus this value should not be used after
the end of the iterator.

The complete semantic match that finds this problem is:
(http://coccinelle.lip6.fr/)

@@
identifier c,member;
expression E,x;
iterator name list_for_each_entry;
iterator name list_for_each_entry_reverse;
iterator name list_for_each_entry_continue;
iterator name list_for_each_entry_continue_reverse;
iterator name list_for_each_entry_from;
iterator name list_for_each_entry_safe;
iterator name list_for_each_entry_safe_continue;
iterator name list_for_each_entry_safe_from;
iterator name list_for_each_entry_safe_reverse;
iterator name hlist_for_each_entry;
iterator name hlist_for_each_entry_continue;
iterator name hlist_for_each_entry_from;
iterator name hlist_for_each_entry_safe;
statement S;
@@

(
list_for_each_entry(c,...,member) { ... when != break;
                                 when forall
                                 when strict
}
|
list_for_each_entry_reverse(c,...,member) { ... when != break;
                                 when forall
                                 when strict
}
|
list_for_each_entry_continue(c,...,member) { ... when != break;
                                 when forall
                                 when strict
}
|
list_for_each_entry_continue_reverse(c,...,member) { ... when != break;
                                 when forall
                                 when strict
}
|
list_for_each_entry_from(c,...,member) { ... when != break;
                                 when forall
                                 when strict
}
|
list_for_each_entry_safe(c,...,member) { ... when != break;
                                 when forall
                                 when strict
}
|
list_for_each_entry_safe_continue(c,...,member) { ... when != break;
                                 when forall
                                 when strict
}
|
list_for_each_entry_safe_from(c,...,member) { ... when != break;
                                 when forall
                                 when strict
}
|
list_for_each_entry_safe_reverse(c,...,member) { ... when != break;
                                 when forall
                                 when strict
}
)
...
(
list_for_each_entry(c,...) S
|
list_for_each_entry_reverse(c,...) S
|
list_for_each_entry_continue(c,...) S
|
list_for_each_entry_continue_reverse(c,...) S
|
list_for_each_entry_from(c,...) S
|
list_for_each_entry_safe(c,...) S
|
list_for_each_entry_safe(x,c,...) S
|
list_for_each_entry_safe_continue(c,...) S
|
list_for_each_entry_safe_continue(x,c,...) S
|
list_for_each_entry_safe_from(c,...) S
|
list_for_each_entry_safe_from(x,c,...) S
|
list_for_each_entry_safe_reverse(c,...) S
|
list_for_each_entry_safe_reverse(x,c,...) S
|
hlist_for_each_entry(c,...) S
|
hlist_for_each_entry_continue(c,...) S
|
hlist_for_each_entry_from(c,...) S
|
hlist_for_each_entry_safe(c,...) S
|
list_remove_head(x,c,...)
|
sizeof(<+...c...+>)
|
&c->member
|
c = E
|
*c
)
