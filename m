Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com
 ([52.27.115.49] helo=osg.samsung.com)
 by casper.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dBWet-0007Fm-OK
 for linux-mtd@lists.infradead.org; Fri, 19 May 2017 01:24:55 +0000
From: Mauro Carvalho Chehab <mchehab@s-opensource.com>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@s-opensource.com>,
 Mauro Carvalho Chehab <mchehab@infradead.org>,
 linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-mtd@lists.infradead.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 10/30] kobject.txt: standardize document format
Date: Thu, 18 May 2017 22:24:02 -0300
Message-Id: <8d58526134d4616ad7a93a58059b5473a65231b2.1495156975.git.mchehab@s-opensource.com>
In-Reply-To: <cover.1495156975.git.mchehab@s-opensource.com>
References: <cover.1495156975.git.mchehab@s-opensource.com>
In-Reply-To: <cover.1495156975.git.mchehab@s-opensource.com>
References: <cover.1495156975.git.mchehab@s-opensource.com>
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

- Add markups for titles;
- mark literal blocks as such;
- add needed whitespace/blank lines;
- use :Author: and :Last updated: for authorship.

Signed-off-by: Mauro Carvalho Chehab <mchehab@s-opensource.com>
---
 Documentation/kobject.txt | 69 ++++++++++++++++++++++++++++-------------------
 1 file changed, 42 insertions(+), 27 deletions(-)

diff --git a/Documentation/kobject.txt b/Documentation/kobject.txt
index 1be59a3a521c..fc9485d79061 100644
--- a/Documentation/kobject.txt
+++ b/Documentation/kobject.txt
@@ -1,13 +1,13 @@
+=====================================================================
 Everything you never wanted to know about kobjects, ksets, and ktypes
+=====================================================================
 
-Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+:Author: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+:Last updated: December 19, 2007
 
 Based on an original article by Jon Corbet for lwn.net written October 1,
 2003 and located at http://lwn.net/Articles/51437/
 
-Last updated December 19, 2007
-
-
 Part of the difficulty in understanding the driver model - and the kobject
 abstraction upon which it is built - is that there is no obvious starting
 place. Dealing with kobjects requires understanding a few different types,
@@ -47,6 +47,7 @@ approach will be taken, so we'll go back to kobjects.
 
 
 Embedding kobjects
+==================
 
 It is rare for kernel code to create a standalone kobject, with one major
 exception explained below.  Instead, kobjects are used to control access to
@@ -65,7 +66,7 @@ their own, but are invariably found embedded in the larger objects of
 interest.)
 
 So, for example, the UIO code in drivers/uio/uio.c has a structure that
-defines the memory region associated with a uio device:
+defines the memory region associated with a uio device::
 
     struct uio_map {
 	struct kobject kobj;
@@ -77,7 +78,7 @@ just a matter of using the kobj member.  Code that works with kobjects will
 often have the opposite problem, however: given a struct kobject pointer,
 what is the pointer to the containing structure?  You must avoid tricks
 (such as assuming that the kobject is at the beginning of the structure)
-and, instead, use the container_of() macro, found in <linux/kernel.h>:
+and, instead, use the container_of() macro, found in <linux/kernel.h>::
 
     container_of(pointer, type, member)
 
@@ -90,13 +91,13 @@ where:
 The return value from container_of() is a pointer to the corresponding
 container type. So, for example, a pointer "kp" to a struct kobject
 embedded *within* a struct uio_map could be converted to a pointer to the
-*containing* uio_map structure with:
+*containing* uio_map structure with::
 
     struct uio_map *u_map = container_of(kp, struct uio_map, kobj);
 
 For convenience, programmers often define a simple macro for "back-casting"
 kobject pointers to the containing type.  Exactly this happens in the
-earlier drivers/uio/uio.c, as you can see here:
+earlier drivers/uio/uio.c, as you can see here::
 
     struct uio_map {
         struct kobject kobj;
@@ -106,23 +107,25 @@ earlier drivers/uio/uio.c, as you can see here:
     #define to_map(map) container_of(map, struct uio_map, kobj)
 
 where the macro argument "map" is a pointer to the struct kobject in
-question.  That macro is subsequently invoked with:
+question.  That macro is subsequently invoked with::
 
     struct uio_map *map = to_map(kobj);
 
 
 Initialization of kobjects
+==========================
 
 Code which creates a kobject must, of course, initialize that object. Some
-of the internal fields are setup with a (mandatory) call to kobject_init():
+of the internal fields are setup with a (mandatory) call to kobject_init()::
 
     void kobject_init(struct kobject *kobj, struct kobj_type *ktype);
 
 The ktype is required for a kobject to be created properly, as every kobject
 must have an associated kobj_type.  After calling kobject_init(), to
-register the kobject with sysfs, the function kobject_add() must be called:
+register the kobject with sysfs, the function kobject_add() must be called::
 
-    int kobject_add(struct kobject *kobj, struct kobject *parent, const char *fmt, ...);
+    int kobject_add(struct kobject *kobj, struct kobject *parent,
+		    const char *fmt, ...);
 
 This sets up the parent of the kobject and the name for the kobject
 properly.  If the kobject is to be associated with a specific kset,
@@ -133,7 +136,7 @@ kset itself.
 
 As the name of the kobject is set when it is added to the kernel, the name
 of the kobject should never be manipulated directly.  If you must change
-the name of the kobject, call kobject_rename():
+the name of the kobject, call kobject_rename()::
 
     int kobject_rename(struct kobject *kobj, const char *new_name);
 
@@ -146,12 +149,12 @@ is being removed.  If your code needs to call this function, it is
 incorrect and needs to be fixed.
 
 To properly access the name of the kobject, use the function
-kobject_name():
+kobject_name()::
 
     const char *kobject_name(const struct kobject * kobj);
 
 There is a helper function to both initialize and add the kobject to the
-kernel at the same time, called surprisingly enough kobject_init_and_add():
+kernel at the same time, called surprisingly enough kobject_init_and_add()::
 
     int kobject_init_and_add(struct kobject *kobj, struct kobj_type *ktype,
                              struct kobject *parent, const char *fmt, ...);
@@ -161,10 +164,11 @@ kobject_add() functions described above.
 
 
 Uevents
+=======
 
 After a kobject has been registered with the kobject core, you need to
 announce to the world that it has been created.  This can be done with a
-call to kobject_uevent():
+call to kobject_uevent()::
 
     int kobject_uevent(struct kobject *kobj, enum kobject_action action);
 
@@ -180,11 +184,12 @@ hand.
 
 
 Reference counts
+================
 
 One of the key functions of a kobject is to serve as a reference counter
 for the object in which it is embedded. As long as references to the object
 exist, the object (and the code which supports it) must continue to exist.
-The low-level functions for manipulating a kobject's reference counts are:
+The low-level functions for manipulating a kobject's reference counts are::
 
     struct kobject *kobject_get(struct kobject *kobj);
     void kobject_put(struct kobject *kobj);
@@ -209,21 +214,24 @@ file Documentation/kref.txt in the Linux kernel source tree.
 
 
 Creating "simple" kobjects
+==========================
 
 Sometimes all that a developer wants is a way to create a simple directory
 in the sysfs hierarchy, and not have to mess with the whole complication of
 ksets, show and store functions, and other details.  This is the one
 exception where a single kobject should be created.  To create such an
-entry, use the function:
+entry, use the function::
 
     struct kobject *kobject_create_and_add(char *name, struct kobject *parent);
 
 This function will create a kobject and place it in sysfs in the location
 underneath the specified parent kobject.  To create simple attributes
-associated with this kobject, use:
+associated with this kobject, use::
 
     int sysfs_create_file(struct kobject *kobj, struct attribute *attr);
-or
+
+or::
+
     int sysfs_create_group(struct kobject *kobj, struct attribute_group *grp);
 
 Both types of attributes used here, with a kobject that has been created
@@ -236,6 +244,7 @@ implementation of a simple kobject and attributes.
 
 
 ktypes and release methods
+==========================
 
 One important thing still missing from the discussion is what happens to a
 kobject when its reference count reaches zero. The code which created the
@@ -257,7 +266,7 @@ is good practice to always use kobject_put() after kobject_init() to avoid
 errors creeping in.
 
 This notification is done through a kobject's release() method. Usually
-such a method has a form like:
+such a method has a form like::
 
     void my_object_release(struct kobject *kobj)
     {
@@ -281,7 +290,7 @@ leak in the kobject core, which makes people unhappy.
 
 Interestingly, the release() method is not stored in the kobject itself;
 instead, it is associated with the ktype. So let us introduce struct
-kobj_type:
+kobj_type::
 
     struct kobj_type {
 	    void (*release)(struct kobject *kobj);
@@ -306,6 +315,7 @@ automatically created for any kobject that is registered with this ktype.
 
 
 ksets
+=====
 
 A kset is merely a collection of kobjects that want to be associated with
 each other.  There is no restriction that they be of the same ktype, but be
@@ -335,13 +345,16 @@ kobject) in their parent.
 
 As a kset contains a kobject within it, it should always be dynamically
 created and never declared statically or on the stack.  To create a new
-kset use:
+kset use::
+
   struct kset *kset_create_and_add(const char *name,
 				   struct kset_uevent_ops *u,
 				   struct kobject *parent);
 
-When you are finished with the kset, call:
+When you are finished with the kset, call::
+
   void kset_unregister(struct kset *kset);
+
 to destroy it.  This removes the kset from sysfs and decrements its reference
 count.  When the reference count goes to zero, the kset will be released.
 Because other references to the kset may still exist, the release may happen
@@ -351,14 +364,14 @@ An example of using a kset can be seen in the
 samples/kobject/kset-example.c file in the kernel tree.
 
 If a kset wishes to control the uevent operations of the kobjects
-associated with it, it can use the struct kset_uevent_ops to handle it:
+associated with it, it can use the struct kset_uevent_ops to handle it::
 
-struct kset_uevent_ops {
+  struct kset_uevent_ops {
         int (*filter)(struct kset *kset, struct kobject *kobj);
         const char *(*name)(struct kset *kset, struct kobject *kobj);
         int (*uevent)(struct kset *kset, struct kobject *kobj,
                       struct kobj_uevent_env *env);
-};
+  };
 
 
 The filter function allows a kset to prevent a uevent from being emitted to
@@ -386,6 +399,7 @@ added below the parent kobject.
 
 
 Kobject removal
+===============
 
 After a kobject has been registered with the kobject core successfully, it
 must be cleaned up when the code is finished with it.  To do that, call
@@ -409,6 +423,7 @@ called, and the objects in the former circle release each other.
 
 
 Example code to copy from
+=========================
 
 For a more complete example of using ksets and kobjects properly, see the
 example programs samples/kobject/{kobject-example.c,kset-example.c},
-- 
2.9.4
