Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com
 ([52.27.115.49] helo=osg.samsung.com)
 by merlin.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dBWgh-0005rT-F8
 for linux-mtd@lists.infradead.org; Fri, 19 May 2017 01:26:40 +0000
From: Mauro Carvalho Chehab <mchehab@s-opensource.com>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@s-opensource.com>,
 Mauro Carvalho Chehab <mchehab@infradead.org>,
 linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-mtd@lists.infradead.org
Subject: [PATCH 06/29] rbtree.txt: standardize document format
Date: Thu, 18 May 2017 22:25:50 -0300
Message-Id: <49f34c0e7b2d9ca96330a9adc7647bfe839f6375.1495157082.git.mchehab@s-opensource.com>
In-Reply-To: <cover.1495157082.git.mchehab@s-opensource.com>
References: <cover.1495157082.git.mchehab@s-opensource.com>
In-Reply-To: <cover.1495157082.git.mchehab@s-opensource.com>
References: <cover.1495157082.git.mchehab@s-opensource.com>
Sender: Mauro Carvalho Chehab <mchehab@smtp.s-opensource.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Each text file under Documentation follows a different
format. Some doesn't even have titles!

Change its representation to follow the adopted standard,
using ReST markups for it to be parseable by Sphinx:

- Mark document title;
- Use :Author: for authorship;
- mark a sub-section title as such;
- mark literal blocks;
- adjust identation where needed.

Signed-off-by: Mauro Carvalho Chehab <mchehab@s-opensource.com>
---
 Documentation/rbtree.txt | 88 +++++++++++++++++++++++++-----------------------
 1 file changed, 46 insertions(+), 42 deletions(-)

diff --git a/Documentation/rbtree.txt b/Documentation/rbtree.txt
index b9d9cc57be18..b8a8c70b0188 100644
--- a/Documentation/rbtree.txt
+++ b/Documentation/rbtree.txt
@@ -1,7 +1,10 @@
+=================================
 Red-black Trees (rbtree) in Linux
-January 18, 2007
-Rob Landley <rob@landley.net>
-=============================
+=================================
+
+
+:Date: January 18, 2007
+:Author: Rob Landley <rob@landley.net>
 
 What are red-black trees, and what are they for?
 ------------------------------------------------
@@ -56,7 +59,7 @@ user of the rbtree code.
 Creating a new rbtree
 ---------------------
 
-Data nodes in an rbtree tree are structures containing a struct rb_node member:
+Data nodes in an rbtree tree are structures containing a struct rb_node member::
 
   struct mytype {
   	struct rb_node node;
@@ -78,7 +81,7 @@ Searching for a value in an rbtree
 Writing a search function for your tree is fairly straightforward: start at the
 root, compare each value, and follow the left or right branch as necessary.
 
-Example:
+Example::
 
   struct mytype *my_search(struct rb_root *root, char *string)
   {
@@ -110,7 +113,7 @@ The search for insertion differs from the previous search by finding the
 location of the pointer on which to graft the new node.  The new node also
 needs a link to its parent node for rebalancing purposes.
 
-Example:
+Example::
 
   int my_insert(struct rb_root *root, struct mytype *data)
   {
@@ -140,11 +143,11 @@ Example:
 Removing or replacing existing data in an rbtree
 ------------------------------------------------
 
-To remove an existing node from a tree, call:
+To remove an existing node from a tree, call::
 
   void rb_erase(struct rb_node *victim, struct rb_root *tree);
 
-Example:
+Example::
 
   struct mytype *data = mysearch(&mytree, "walrus");
 
@@ -153,7 +156,7 @@ Example:
   	myfree(data);
   }
 
-To replace an existing node in a tree with a new one with the same key, call:
+To replace an existing node in a tree with a new one with the same key, call::
 
   void rb_replace_node(struct rb_node *old, struct rb_node *new,
   			struct rb_root *tree);
@@ -166,7 +169,7 @@ Iterating through the elements stored in an rbtree (in sort order)
 
 Four functions are provided for iterating through an rbtree's contents in
 sorted order.  These work on arbitrary trees, and should not need to be
-modified or wrapped (except for locking purposes):
+modified or wrapped (except for locking purposes)::
 
   struct rb_node *rb_first(struct rb_root *tree);
   struct rb_node *rb_last(struct rb_root *tree);
@@ -184,7 +187,7 @@ which the containing data structure may be accessed with the container_of()
 macro, and individual members may be accessed directly via
 rb_entry(node, type, member).
 
-Example:
+Example::
 
   struct rb_node *node;
   for (node = rb_first(&mytree); node; node = rb_next(node))
@@ -241,7 +244,8 @@ user should have a single rb_erase_augmented() call site in order to limit
 compiled code size.
 
 
-Sample usage:
+Sample usage
+^^^^^^^^^^^^
 
 Interval tree is an example of augmented rb tree. Reference -
 "Introduction to Algorithms" by Cormen, Leiserson, Rivest and Stein.
@@ -259,12 +263,12 @@ This "extra information" stored in each node is the maximum hi
 information can be maintained at each node just be looking at the node
 and its immediate children. And this will be used in O(log n) lookup
 for lowest match (lowest start address among all possible matches)
-with something like:
+with something like::
 
-struct interval_tree_node *
-interval_tree_first_match(struct rb_root *root,
-			  unsigned long start, unsigned long last)
-{
+  struct interval_tree_node *
+  interval_tree_first_match(struct rb_root *root,
+			    unsigned long start, unsigned long last)
+  {
 	struct interval_tree_node *node;
 
 	if (!root->rb_node)
@@ -301,13 +305,13 @@ interval_tree_first_match(struct rb_root *root,
 		}
 		return NULL;	/* No match */
 	}
-}
+  }
 
-Insertion/removal are defined using the following augmented callbacks:
+Insertion/removal are defined using the following augmented callbacks::
 
-static inline unsigned long
-compute_subtree_last(struct interval_tree_node *node)
-{
+  static inline unsigned long
+  compute_subtree_last(struct interval_tree_node *node)
+  {
 	unsigned long max = node->last, subtree_last;
 	if (node->rb.rb_left) {
 		subtree_last = rb_entry(node->rb.rb_left,
@@ -322,10 +326,10 @@ compute_subtree_last(struct interval_tree_node *node)
 			max = subtree_last;
 	}
 	return max;
-}
+  }
 
-static void augment_propagate(struct rb_node *rb, struct rb_node *stop)
-{
+  static void augment_propagate(struct rb_node *rb, struct rb_node *stop)
+  {
 	while (rb != stop) {
 		struct interval_tree_node *node =
 			rb_entry(rb, struct interval_tree_node, rb);
@@ -335,20 +339,20 @@ static void augment_propagate(struct rb_node *rb, struct rb_node *stop)
 		node->__subtree_last = subtree_last;
 		rb = rb_parent(&node->rb);
 	}
-}
+  }
 
-static void augment_copy(struct rb_node *rb_old, struct rb_node *rb_new)
-{
+  static void augment_copy(struct rb_node *rb_old, struct rb_node *rb_new)
+  {
 	struct interval_tree_node *old =
 		rb_entry(rb_old, struct interval_tree_node, rb);
 	struct interval_tree_node *new =
 		rb_entry(rb_new, struct interval_tree_node, rb);
 
 	new->__subtree_last = old->__subtree_last;
-}
+  }
 
-static void augment_rotate(struct rb_node *rb_old, struct rb_node *rb_new)
-{
+  static void augment_rotate(struct rb_node *rb_old, struct rb_node *rb_new)
+  {
 	struct interval_tree_node *old =
 		rb_entry(rb_old, struct interval_tree_node, rb);
 	struct interval_tree_node *new =
@@ -356,15 +360,15 @@ static void augment_rotate(struct rb_node *rb_old, struct rb_node *rb_new)
 
 	new->__subtree_last = old->__subtree_last;
 	old->__subtree_last = compute_subtree_last(old);
-}
+  }
 
-static const struct rb_augment_callbacks augment_callbacks = {
+  static const struct rb_augment_callbacks augment_callbacks = {
 	augment_propagate, augment_copy, augment_rotate
-};
+  };
 
-void interval_tree_insert(struct interval_tree_node *node,
-			  struct rb_root *root)
-{
+  void interval_tree_insert(struct interval_tree_node *node,
+			    struct rb_root *root)
+  {
 	struct rb_node **link = &root->rb_node, *rb_parent = NULL;
 	unsigned long start = node->start, last = node->last;
 	struct interval_tree_node *parent;
@@ -383,10 +387,10 @@ void interval_tree_insert(struct interval_tree_node *node,
 	node->__subtree_last = last;
 	rb_link_node(&node->rb, rb_parent, link);
 	rb_insert_augmented(&node->rb, root, &augment_callbacks);
-}
+  }
 
-void interval_tree_remove(struct interval_tree_node *node,
-			  struct rb_root *root)
-{
+  void interval_tree_remove(struct interval_tree_node *node,
+			    struct rb_root *root)
+  {
 	rb_erase_augmented(&node->rb, root, &augment_callbacks);
-}
+  }
-- 
2.9.4
